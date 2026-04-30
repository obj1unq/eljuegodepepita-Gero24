import wollok.game.*
import direcciones.*

object pepita {
	var property position = game.at(2, 3)
	var estado = viva
	var energia = 100
	
	method image() = estado.image()
	
	method comer(comida) {
		energia += comida.energiaQueOtorga()
		self.actualizarEstado()
	}
	
	method volar(kms) {
		energia = energia - (9 * kms)
	}
	
	method energia() = energia
	
	method actualizarEstado() {
		if (energia <= 0 || self.estaAtrapada()) {
			estado = muerta
		} else {
			estado = viva
		}
	}
	
	method estaAtrapada() = self.position() == silvestre.position()
	
	method mover(direccion) {
		if (estado.puedeMoverse()) {
			const posicionAnterior = position
			const posicionNueva = direccion.moverDesde(posicionAnterior)
			self.volar(posicionAnterior.distance(posicionNueva))
			position = posicionNueva
			self.actualizarEstado()
		}
	}
}

object muerta {
	method image() = "pepita-gris.png"

	method puedeMoverse() = false
}

object viva {
	method image() = "pepita.png"
	
	method puedeMoverse() = true
}

object silvestre {
	var property presa = pepita
	var property position = game.at(3, 0)
	
	method image() = "silvestre.png"
	
	method perseguir() {
		const xPresa = presa.position().x()
		const xSilvestre = self.position().x()
		
		if (xPresa > xSilvestre) {
			self.mover(derecha)
		} else {
			if ((xPresa < xSilvestre) && self.puedeMoverseALIzquierda()) self.mover(izquierda)
		}
	}
	
	method puedeMoverseALIzquierda() = self.position().x() > 3
	
	method mover(direccion) {
		position = direccion.moverDesde(position)
		presa.actualizarEstado()
	}
}
