import pepita.*
object arriba {
  method moverDesde(unaPosicion) = unaPosicion.up(1)

}

object abajo {
  method moverDesde(unaPosicion) = unaPosicion.down(1)

}

object izquierda {
  method moverDesde(unaPosicion) = unaPosicion.left(1)
}

object derecha {
  method moverDesde(unaPosicion) = unaPosicion.right(1)
}
