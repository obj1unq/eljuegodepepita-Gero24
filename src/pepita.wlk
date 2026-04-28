import wollok.game.*
import direcciones.*

object pepita {
	var property position = game.at(2, 3)
	var energia = 100
	
	method image() {
		if (self.estaAtrapada()) {
			return "pepita-gris.png"
		} else {
			return "pepita.png"
		}
	}
	
	method comer(comida) {
		energia += comida.energiaQueOtorga()
	}
	
	method volar(kms) {
		energia = (energia - 10) - kms
	}
	
	method energia() = energia
	
	method estaAtrapada() = self.position() == silvestre.position()
	
	method mover(direccion) {
		position = direccion.moverDesde(position)
	}
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
			if ((xPresa < xSilvestre) && (xSilvestre > 3)) self.mover(izquierda)
		}

	}

	method mover(direccion) {
		position = direccion.moverDesde(position)
	}
}