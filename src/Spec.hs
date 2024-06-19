module Spec where
import PdePreludat
import Library
import Test.Hspec

juan = Persona { nombre = "Juan", edad = 45, nivelDeAlegria = 120, nivelDeAmsiedad = 80, tareas = ["Tarea1", "Tarea2"] }
maria = Persona { nombre = "Maria", edad = 50, nivelDeAlegria = 110, nivelDeAmsiedad = 90, tareas = ["Tarea3"] }
pedro = Persona { nombre = "Pedro", edad = 35, nivelDeAlegria = 100, nivelDeAmsiedad = 70, tareas = ["Tarea4", "Tarea5", "Tarea6"] }
ana = Persona { nombre = "Ana", edad = 40, nivelDeAlegria = 99, nivelDeAmsiedad = 60, tareas = [] }
luis = Persona { nombre = "Luis", edad = 55, nivelDeAlegria = 80, nivelDeAmsiedad = 50, tareas = ["Tarea7"] }
sofia = Persona { nombre = "Sofia", edad = 60, nivelDeAlegria = 7, nivelDeAmsiedad = 40, tareas = ["Tarea8", "Tarea9"] }
carlos = Persona { nombre = "Carlos", edad = 65, nivelDeAlegria = 60, nivelDeAmsiedad = 30, tareas = ["Tarea10", "Tarea11", "Tarea12"] }
lucia = Persona { nombre = "Lucia", edad = 70, nivelDeAlegria = 53, nivelDeAmsiedad = 20, tareas = [] }
jose = Persona { nombre = "Jose", edad = 75, nivelDeAlegria = 40, nivelDeAmsiedad = 10, tareas = ["Tarea13"] }
isabel = Persona { nombre = "Isabel", edad = 80, nivelDeAlegria = 31, nivelDeAmsiedad = 0, tareas = ["Tarea14", "Tarea15"] }

grupoDeAmigos :: [Persona]
grupoDeAmigos = [juan, maria, pedro, ana, luis, sofia, carlos, lucia, jose, isabel]

correrTests :: IO ()
correrTests = hspec $ do
    describe "nivelDeEnergia" $ do
        it "Calcula correctamente la energía para Juan" $ do
            nivelDeEnergia juan `shouldBe` 240

        it "Calcula correctamente la energía para Maria" $ do
            nivelDeEnergia maria `shouldBe` 220

        it "Calcula correctamente la energía para Pedro" $ do
            nivelDeEnergia pedro `shouldBe` 200

        it "Calcula correctamente la energía para Ana" $ do
            nivelDeEnergia ana `shouldBe` 198

    describe "cuantoDueleVerLasBuenas" $ do
        it "Devuelve True si todos los jovatos tienen energía > 100" $ do
            cuantoDueleVerLasBuenas [juan, maria, luis] `shouldBe` True

        it "Devuelve False si algún jovato tiene energía <= 100" $ do
            cuantoDueleVerLasBuenas [juan, maria, sofia] `shouldBe` False

    describe "nivelTotalDeAmsiedad" $ do
        it "Calcula correctamente el nivel total de ansiedad de los jovatos" $ do
            nivelTotalDeAmsiedad grupoDeAmigos `shouldBe` 380

    describe "losMasCriticados" $ do
        it "Encuentra a las personas más criticadas según el nivel de ansiedad > 50" $ do
            losMasCriticados ((> 50) . nivelDeAmsiedad) grupoDeAmigos `shouldBe` ["Juan", "Maria"]

        it "Encuentra a las personas más criticadas según los niveles de energía par" $ do
            losMasCriticados (even . nivelDeEnergia) grupoDeAmigos `shouldBe` ["Juan", "Maria"]

    describe "energiaResultante" $ do
        it "Calcula correctamente la energía resultante después de realizar tareas" $ do
            energiaResultante juan [codearUnProyectoNuevo, escucharMusica] `shouldBe` 340

    describe "hiceLoQuePude" $ do
        it "Devuelve la persona sin modificar si el nivel de energía permanece por encima de 100" $ do
            hiceLoQuePude juan [codearUnProyectoNuevo] `shouldBe` juan

        it "Deja de aplicar tareas cuando el nivel de energía llega a <= 100" $ do
            let tasks = [andarEnBici 5, hacerTramitesEnAfip 2]
            hiceLoQuePude pedro tasks `shouldBe` pedro { nivelDeAlegria = 100, nivelDeAmsiedad = 70 }
