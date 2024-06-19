module Library where
import PdePreludat
import Test.Hspec.Runner (Config(configPrintSlowItems))

doble :: Number -> Number
doble numero = numero + numero

--Punto 1

type Yulius = Number
type Alegronios = Number
type Nerviofrinas = Number

data Persona = Persona{
    nombre :: String,
    edad :: Number,
    nivelDeAlegria :: Alegronios,
    nivelDeAmsiedad :: Nerviofrinas,
    tareas :: [String]
} deriving (Show, Eq)

nivelDeEnergia :: Persona -> Yulius
nivelDeEnergia persona  |   nivelDeAlegria persona > nivelDeAmsiedad persona = min 340 . doble . nivelDeAlegria $ persona
                        |   nivelDeAlegria persona < nivelDeAmsiedad persona && esJoven persona = nivelDeEstres persona - 300
                        |   otherwise = (+ 10) . nivelDeAlegria $ persona

esJoven :: Persona -> Bool
esJoven = (< 40) . edad

nivelDeEstres :: Persona -> Number
nivelDeEstres  persona  |   (> 5) . length . tareas $ persona = (* 1.5) . nivelDeAmsiedad $ persona
                        |   otherwise = nivelDeAmsiedad persona

--Punto 2

cuantoDueleVerLasBuenas :: [Persona] -> Bool
cuantoDueleVerLasBuenas personas = all ((> 100) . nivelDeEnergia) (jovatos personas)

jovatos :: [Persona] -> [Persona]
jovatos = filter (not . esJoven)

nivelTotalDeAmsiedad :: [Persona] -> Nerviofrinas
nivelTotalDeAmsiedad = sum . map nivelDeAmsiedad . jovatos

losMasCriticados :: Criterio -> [Persona] -> [Nombre]
losMasCriticados criterio = take 2 . map nombre . filter criterio

-- > losMasCriticados ((> 50) . nivelDeAmsiedad) grupoDeAmigos
-- > losMasCriticados (even . nivelDeEnergia) grupoDeAmigos

type Nombre = String
type Criterio = Persona -> Bool

--Punto 3

descomprimir :: Persona -> Persona
descomprimir persona = persona {nivelDeAmsiedad = max 0 (nivelDeAmsiedad persona - 10)}

codearUnProyectoNuevo :: Tarea
codearUnProyectoNuevo persona = descomprimir persona {nivelDeAlegria = (+ 110) . nivelDeAlegria $ persona, nivelDeAmsiedad = (+ 50) . nivelDeAmsiedad $ persona}

type Tarea = Persona -> Persona

hacerTramitesEnAfip :: Number -> Tarea
hacerTramitesEnAfip cantidadDeTramites persona = descomprimir persona {nivelDeAmsiedad = max 300 ((* cantidadDeTramites) . nivelDeAmsiedad $ persona)}

andarEnBici :: Number -> Tarea
andarEnBici kilometros persona = persona {nivelDeAlegria = (+ 50 * kilometros) . nivelDeAlegria $ persona, nivelDeAmsiedad = 0}

escucharMusica :: Tarea
escucharMusica = descomprimir . descomprimir

--Punto 4

energiaResultante :: Persona -> [Tarea] -> Yulius
energiaResultante persona tareas = nivelDeEnergia $ foldl (flip ($)) persona tareas

--Punto 5

hiceLoQuePude :: Persona -> [Tarea] -> Persona
hiceLoQuePude persona [] = persona
hiceLoQuePude persona (tarea:tareas)    |   (> 100) . nivelDeEnergia $ tarea persona = hiceLoQuePude persona tareas
                                        |   otherwise = persona

--Punto 6

--En el caso de cuantoDueleVerLasBuenas, gracias a que haskell usa lazy evaluation, cuanto encuentre un jovato de la lista de personas que tiene un nivel de energia menor o igual a 100, será el unico caso en el que convergerá, retornando false.
--Para nivelTotalDeAmsiedad, no podemos determinarlo en una lista de personas infinitas. Esto se debe a que para filtrar los jovatos de la lista infinita, necesitariamos recorrerla toda, no hay una condicion de corte.