import wollok.game.*

class Muro {
  
  var property position 
  method image() = "muro.png"
}

object muros {
  
  const listaMuros = [
    new Muro(position = game.at(0, 1)),
    new Muro(position = game.at(0, 2)),
    new Muro(position = game.at(0, 3)),
    new Muro(position = game.at(0, 4)),
    new Muro(position = game.at(0, 5)),
    new Muro(position = game.at(0, 6)),
    new Muro(position = game.at(0, 7)),
    new Muro(position = game.at(0, 8)),
    new Muro(position = game.at(0, 9)),
    new Muro(position = game.at(9, 1)),
    new Muro(position = game.at(9, 2)),
    new Muro(position = game.at(9, 3)),
    new Muro(position = game.at(9, 4)),
    new Muro(position = game.at(9, 5)),
    new Muro(position = game.at(9, 6)),
    new Muro(position = game.at(9, 7)),
    new Muro(position = game.at(9, 8)),
    new Muro(position = game.at(9, 9))
  ]

  method listaMuros() = listaMuros

  method hayMuroEn(posicion) = listaMuros.any { muro => muro.position() == posicion} 
}

object nido {
  
  var property position = game.at(6,6)

  method image() = "nido.png" 
}