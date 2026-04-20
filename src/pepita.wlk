import wollok.game.*


object pepita {
	var property position = game.at(2,3)
	var energia = 100

	method image() = "pepita.png" 

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method volar(kms) {
		energia = energia - 10 - kms 
	}
	
	method energia() {
		return energia
	}

}

object silvestre {
	
	method position() = game.at(pepita.position().x(), 0)

	method image() = "silvestre.png"

	/* method perseguirA(pepita) {
		const pepitaCoordenadaX = pepita.position().x()
		const silvestreCoordinadaX = self.position().x()

		if (pepitaCoordenadaX > silvestreCoordinadaX) {
			position = position.right(1)
		} else if (pepitaCoordenadaX < silvestreCoordinadaX) {
			position = position.left(1)
		}
	} 
	*/
	
}
