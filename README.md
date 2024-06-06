# Excelsior

Encontramos la manera de convertir la tierra en oro mágicamente! O eso creían los alquimistas, aunque en realidad no era magia, si no que era ciencia, química para ser exactos.

Hoy en día, las sustancias químicas abundan. Es por ello que, para llevar un mejor recuento de las sustancias ya existentes y las nuevas creadas, nos decidimos a hacer un sistema con dicho fin, en Haskell.

En nuestro análisis, nos encontramos con que las sustancias pueden clasificarse en dos tipos: compuestas o sencillas.

Las sustancias sencillas son aquellas que se corresponden directamente a un elemento de la tabla periódica, de allí su otro nombre, elemento. De los elementos conocemos su nombre, símbolo químico y número atómico.

Las sustancias compuestas, o simplemente compuestos, son aquellas que tienen una serie de componentes. Un componente es un par formado por una sustancia y la cantidad de moléculas de esa sustancia. La sustancia del componente puede ser un elemento o un compuesto. Además los compuestos, al igual que las sustancias simples, tienen un nombre, pero no número atómico. También poseen un símbolo o fórmula química, la cual no nos interesa conocer en todo momento, ya que es deducible a partir de las sustancias que la componen.

Ah, nos olvidábamos, también sabemos que todas las sustancias poseen un grupo o especie, que puede ser metal, no metal, halógeno o gas noble.


Se pide, entonces

- 1. Modelar las siguientes sustancias:
     - a. El hidrógeno y el oxígeno
     - b. El agua, sustancia compuesta por 2 hidrógenos y 1 un oxígeno.
- 2. Poder saber si una sustancia conduce bien según un criterio. Los criterios actuales son electricidad y calor, pero podría haber más. Los metales conducen bien cualquier criterio, sean compuestos o elementos. Los elementos que sean gases nobles conducen bien la electricidad, y los compuestos halógenos conducen bien el calor. Para el resto, no son buenos conductores.
- 3. Obtener el nombre de unión de un nombre. Esto se logra añadiendo “uro” al final del nombre, pero solo si el nombre termina en consonante. Si termina en vocal, se busca hasta la última consonante y luego sí, se le concatena “uro”. Por ejemplo, el nombre de unión del Fluor es “fluoruro”, mientras que el nombre de unión del mercurio es “mercururo”[1].
- 4. Combinar 2 nombres. Al nombre de unión del primero lo concatenamos con el segundo, agregando un “ de “ entre medio. Por ejemplo, si combino “cloro” y “sodio” debería obtener “cloruro de sodio”.
- 5. Mezclar una serie de componentes entre sí. El resultado de dicha mezcla será un compuesto. Sus componentes serán los componentes mezclados. El nombre se forma de combinar los nombres de la sustancia de cada componente. La especie será, arbitrariamente, un no metal.
- 6. Obtener la fórmula de una sustancia:
    - para los elementos es su símbolo químico
    - para los compuestos es la concatenación de las representaciones de sus componentes y se pone entre paréntesis

La representación de un componente depende de la cantidad de moléculas:

    si tiene una, entonces solo es la fórmula de su sustancia
    si tiene más, entonces es la fórmula de su sustancia y la cantidad[2]
Por ejemplo, la fórmula del agua debería ser (H2O). ¡Recuerden que una sustancia compuesta puede estar compuesta por otras sustancias compuestas!