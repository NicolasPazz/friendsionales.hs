# Friendsionales

¡¡Tenemos amistades!! y como en cualquier grupo de personas, todos tenemos nuestras particularidades. Muchas veces nos juntamos a contar nuestras alegrías, nuestras penas y son los amigos quienes están siempre para acompañarnos. Queremos generar un modelo para estas situaciones, entonces vamos a describir el requerimiento.

Las personas tenemos nombre y edad (claro está) pero además , como somos seres de energía, tenemos un nivel de energía que nos representa. La misma se mide en yulius. 
Este nivel está dado en función de varias cosas como por ejemplo el nivel de alegría de una persona (que se mide en alegronios), el nivel de amsiedad (que se mide en nerviofrinas) y las tareas que tiene que hacer una persona. Estas últimas afectan siempre a la persona modificando ciertos valores dependiendo cada caso. Más adelante profundizaremos sobre este tema.

Para las personas que son más alegres que ansiosas, es decir que su nivel de alegronios es superior al de nerviofrinas, su energía es el doble de los alegronios y no más de 340 yulius. 
Si por el contrario es más ansioso que alegre y es joven (es decir menos de 40 años), la energía es 300 yulius menos el nivel de estrés de una persona (el mismo equivale al nivel de amsiedad de la persona pero se multiplica por 1.5 si es que tiene más de 5 tareas pendientes).
Por el contrario, si no cumple con estas condiciones, la energía es directamente el nivel de alegría más 10 yulius.


## Punto 1
Se pide modelar a la persona y poder obtener su nivel de energía.


## Punto 2
Dado el grupo de amigos, queremos saber:
-**cuantoDueleVerLasBuenas** que ocurre para un grupo cuando todos los jovatos (o sea de 40 o más años) son vitales, es decir que tienen más de 100 yulius de energía.
-**nivelTotalDeAmsiedad** que es la sumatoria del nivel de amsiedad de los jovatos de un grupo.
-Los nombres de losMasCriticados. Son las primeras dos personas que cumplen con algún criterio. Dar un ejemplo de como invocar a **losMasCriticados** para
    -Los que tienen un nivel de amsiedad > 50
    -Los que tienen un nivel de energía par


## Punto 3
Vamos a modelar las tareas. Cada vez que se realiza una tarea se descomprime a la persona. Esto hace que baje en 10 nerviofrinas su nivel amsiedad luego de realizar la misma. El mínimo valor de amsiedad es cero.
-**codearUnProyectoNuevo** incrementa la alegría en 110 alegronios y también aumenta la amsiedad en 50 nerviofrinas. Por ejemplo si Juan que tiene 100 alegronios y 100 nerviofrinas, luego de codearUnProyectoNuevo tiene 210 alegronios y 140 nerviofrinas (el valor inicial de 100 + 50 que se adicionan pero luego 10 que se pierden por terminar la tarea).
-**hacerTramitesEnAfip** que como mínimo deja 300 nerviofrinas y resulta de multiplicar el nivel de amsiedad de la persona por la cantidad de trámites que debe realizar en la AFIP. Si por ejemplo Cecilia tiene que hacer 2 trámites en AFIP y tiene 40 nerviofrinas, pasa a tener como resultado 290 nerviofrinas(40 * 2 = 80 nerviofrinas pero lo mínimo que deja son 300. Luego descomprime 10 unidades por sacarse la tarea de encima). En el caso de Juan que tiene amsiedad de 250 nerviofrinas, luego de hacer 2 trámites en afip queda con 490 nerviofrinas (250 * 2 = 500 unidades y le quitamos 10 al descomprimir).
-**andarEnBici** que nos quita toda la amsiedad y nos da 50 alegronios por cada kilómetro recorrido. Si por ejemplo Cecilia tiene 90 alegronios y 65 nerviofrinas, tras andar en bici queda con 140 alegronios y 0 nerviofrinas (no debe quedar con menos de cero).
-**escucharMusica** que nos descomprime. Si Santiago tiene 30 nerviofrinas y escucha música, queda con 10 nerviofrinas (resta 10 por escuchar y 10 por descomprimir al realizar la tarea).


## Punto 4
Queremos saber la **energiaResultante** que dada una persona y una lista de tareas es la energía calculada para una persona luego de hacer todas las tareas. No se puede utilizar recursividad en este punto.


## Punto 5
Modelar **hiceLoQuePude** para una persona y una serie de tareas . La persona intenta tomar de a una las tareas y realizarlas, siempre y cuando la tarea lo deje con más de 100 yulius de energía. Si cumple con la condición la ejecuta y pasa a la siguiente, pero si no supera este valor, deja de hacer tareas y la persona queda en dicho estado. Resolver este punto con recursividad.


## Punto 6
Dada una lista de personas infinitas, ¿podemos determinar el **nivelTotalDeAmsiedad** o **cuantoDueleVerLasBuenas**? Justifique su respuesta
