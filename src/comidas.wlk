import wollok.game.*
import randomizer.*


object manzana {
	const base= 5
	var madurez = 1

	method image() = "manzana.png"
  method position() = game.at(5,5)
	method energiaQueOtorga() {
		return base * madurez	
	}
	
	method madurar() {
		madurez = madurez + 1
	}
	
}

object alpiste {

	method energiaQueOtorga() {
		return 20
	} 

}

