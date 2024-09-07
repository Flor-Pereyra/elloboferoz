import wollok.game.*




object historia {

  method iniciar() {
    
    game.width(20)
    game.height(14)
    game.addVisualCharacter(loboFeroz)
    game.addVisualCharacter(caperucita)
    game.addVisualCharacter(abuelita)
    game.addVisualCharacter(cazador)
    game.onCollideDo(loboFeroz, {abuelita=> abuelita.comerAbuelita()})
    game.onCollideDo(loboFeroz, {caperucita=> caperucita.comercaperucita()})
    game.onCollideDo(loboFeroz, {cazador=> cazador.espantaAlLobo()})
    game.start()

    
    self.espantaAlLobo()
   

  }
   

    method espantaAlLobo() {
    game.onTick(1000, "aparecen la abuelita y caperucita",{new caperucita().addVisualCharacter(abuelita)})
   }
}
object loboFeroz {
  
  var property position = null
  var property comerAbuelita = peso + 5
  //se come a la abuelita
  var property comerCaperucita = peso + 6
  //se come a caperucita
  var property espantaAlLobo = peso - (comerAbuelita + comerCaperucita)
  //el cazador se para sobre el lobo y lo espanta haciendo que su peso disminulla al tirar a Caperucita y a la abuelita
  var peso = 10
  var property correr = peso - 1
  //correr disminuye el peso en 1

  method comerAbuelita() {
    return game.removeVisual(abuelita)
  }

  method comerCaperucita() {
    return game.removeVisual(caperucita)
  }
  
 

  method peso() = peso 
  method corre() {
    peso = peso - 1
  }

  method aparecer() {
    game.addVisual(self)
    self.moverseAleatoriamente()
  }
  method moverseAleatoriamente() {}

  method image() = "lobo.png"

}


object caperucita {
  var property position = game.at(3, 0)
  
  method image() = "caperucita.png"
}

object cazador {
  var property position = game.at(3, 5)
  
   method image() = "cazador.png"
}


object abuelita {
  var property position = game.at(3, 3)
  method image() = "abuelita.png"
}