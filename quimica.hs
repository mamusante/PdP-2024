import Data.List
import Text.Show.Functions

--Las sustancias sencillas son elementos, se corresponden con los elementos de la tabla periodica

data Elemento = Elemento {
    nombreElemento :: String,
    simboloQuimico :: String,
    nroAtomico :: Int,
    grupoElemento :: Grupo

}deriving(Show)

-- Sustancias compuestas o compuestos son aquellas con una serie de componentes, par formado
-- por una sustancia y la cantidad de moleculas de esa sustancia

data Compuesto = Compuesto {
    nombreCompuesto :: String,
    componentes :: [Componente],
    grupoCompuesto :: Grupo
}deriving(Show)

-- todas las sustancias poseen un grupo que puede ser ...
data Grupo = Metal | NoMetal | Halogeno | GasNoble deriving(Eq , Show)

-- la sustancia del componente puede ser un elemento o un compuesto

data Sustancias = Simple Elemento | NoSimple Compuesto deriving(Show)

data Componente = Componente {
    sustancia :: Sustancias,
    cantidad :: Int
}deriving(Show)

hidrogeno :: Sustancias
hidrogeno = Simple (Elemento "Hidrogeno" "H" 1 NoMetal)

oxigeno :: Sustancias
oxigeno = Simple (Elemento "Oxigeno" "O" 8 NoMetal)

fluor :: Sustancias
fluor = Simple (Elemento "Fluor" "F" 9 Halogeno)

componenteOxigeno :: Componente
componenteOxigeno = Componente oxigeno 1

componenteHidrogeno :: Componente
componenteHidrogeno = Componente hidrogeno 2



agua :: Sustancias
agua = NoSimple (Compuesto "Agua" [componenteHidrogeno , componenteOxigeno] NoMetal)

data Criterios = Electricidad | Calor deriving(Eq)

-- Punto 2 ... ver si son buenos conductores
conduceBien :: Sustancias -> Criterios -> Bool

conduceBien (NoSimple compuesto) criterio 
    | grupoCompuesto compuesto == Metal = True
    | grupoCompuesto compuesto == Halogeno && criterio == Calor = True
    | otherwise = False

conduceBien (Simple elemento) criterio 
    | grupoElemento elemento == Metal = True
    | grupoElemento elemento == GasNoble && criterio == Electricidad = True
    | otherwise = False


-- Punto 3 ... obtener el nombre de union de un nombre, esto se logra anadiendo ¨uro¨
-- al final del nombre, pero solo si termina en consonante. Si termina en vocal , se busca
-- hasta la ultima consonante y ahora si se le concatena uro
-- EJ fluor -> fluoruro; mercurio es mercoruro
esVocal:: Char -> Bool
esVocal letra = elem letra "aeiouAEIOU"


obtenerNombreUnion :: Sustancias -> String 
obtenerNombreUnion (Simple elemento)
    |not . esVocal . last $ nombreElemento elemento = nombreElemento elemento ++ "uro" 
    |otherwise = (++ "uro") . reverse . dropWhile esVocal . reverse . nombreElemento $ elemento 


obtenerNombreSustancia :: Sustancias -> String
obtenerNombreSustancia (Simple elemento) = nombreElemento elemento
obtenerNombreSustancia (NoSimple compuesto) = nombreCompuesto compuesto

-- Punto 4 ... combinar dos nombres: al nombre de union del primero lo concatenamos con el segundo,
-- agregando un "de" entre medio. Por ej cloro y sodio = cloruro de sodio

combinarNombres :: Sustancias -> Sustancias -> String
combinarNombres elemento1 elemento2 = obtenerNombreUnion elemento1 ++ " de " ++ obtenerNombreSustancia elemento2 

-- Punto 5 ... Mezclar una serie de componentes. El resultado de dicha mezcla sera un compuesto. Sus componentes seran los
-- componentes mezclados. El nombre se forma de combinar los nombres de la sustancia de cada componente. La especie sera NoMetal

mezclarComponentes :: Componente -> Componente -> Sustancias
mezclarComponentes componente1 componente2 = NoSimple (Compuesto nombre [componente1 , componente2] NoMetal)
    where nombre = combinarNombres (sustancia componente1) (sustancia componente2)

-- Punto 6 ... obtener la formula de la sustancia: 
--            Elementos: Simbolo Quimico
--            Compuestos: concatenacion de la representacion de sus componentes y se pone entre parentesis


obtenerFormulaSustancia :: Sustancias -> String

obtenerFormulaSustancia (Simple elemento)= simboloQuimico elemento
obtenerFormulaSustancia (NoSimple compuesto) = "(" ++ obtenerFormulaCompuesto (componentes compuesto) ++ ")"
    where 
        -- obtenerFormulaCompuesto recibe una lista, devuelve un string
        obtenerFormulaCompuesto [] = "" 
        obtenerFormulaCompuesto (c:cola) = obtenerFormulaSustancia (sustancia c) ++ show (cantidad c) ++ obtenerFormulaCompuesto cola
        -- desarmo la lista haciendo (c:cola) siendo c el primero y la cola la cola
        -- hago ++ obtenerFormulaCompuesto cola para que siga separando la cola 1 a 1

-- created by Maria, Musante claro

