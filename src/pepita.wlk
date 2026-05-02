
import wollok.game.*
import direcciones.*
import extras.*

object pepita {
	var property position = game.at(2, 3)
	var estado = viva
	var energia = 100
	
	method image() = estado.image()
	
	method energia() = energia
	
	method estaDentroDelTablero(unaPosicion) = (((unaPosicion.x() >= 0) && (unaPosicion.x() < game.width())) && (unaPosicion.y() >= 0)) && (unaPosicion.y() < game.height())
	
	method hayMuroEn(posicion) = muros.hayMuroEn(posicion)
	
	method puedeMoverse(posicion) = (estado.estaViva() && self.estaDentroDelTablero(posicion)) && (!self.hayMuroEn(posicion))
	
	method volar(kms) {
		energia -= 9 * kms
	}
	
	method mover(direccion) {
		const posicionAnterior = position
		const posicionNueva = direccion.moverDesde(posicionAnterior)
		
		if (self.puedeMoverse(posicionNueva)) {
			position = posicionNueva
			self.volar(posicionAnterior.distance(posicionNueva))
			self.actualizarEstado()
		}
	}
	
	method descender() {
		const posicionNueva = abajo.moverDesde(position)
		
		if (self.puedeMoverse(posicionNueva)) {
			position = posicionNueva
			self.actualizarEstado()
		}
	}
	
	method comer(comida) {
		energia += comida.energiaQueOtorga()
		self.actualizarEstado()
	}
	
	method actualizarEstado() {
		if ((energia <= 0) || self.estaAtrapada()) {
			estado = muerta
		} else {
			estado = viva
		}
	}
	
	method estaAtrapada() = self.position() == silvestre.position()
	
	method reiniciar() {
		position = game.at(2, 3)
		estado = viva
		energia = 100
	}
}

object muerta {
	method image() = "pepita-gris.png"
	
	method estaViva() = false
}

object viva {
	method image() = "pepita.png"
	
	method estaViva() = true
}

object silvestre {
	var property presa = pepita
	var property position = game.at(3, 0)
	
	method image() = "silvestre.png"
	
	method puedeMoverseALIzquierda() = self.position().x() > 3
	
	method mover(direccion) {
		position = direccion.moverDesde(position)
		presa.actualizarEstado()
	}
	
	method perseguir() {
		const xPresa = presa.position().x()
		const xSilvestre = self.position().x()
		
		if (xPresa > xSilvestre) {
			self.mover(derecha)
		} else {
			if ((xPresa < xSilvestre) && self.puedeMoverseALIzquierda()) self.mover(
					izquierda
				)
		}
	}
	
	method reiniciar() {
		presa = pepita
		position = game.at(3, 0)
	}
}
