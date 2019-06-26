import parcelas.*

class Semillas {

	const horasDeSolQueTolera = 0
	const altura = 0
	const anioDeObtencion = 0

	method esFuerte() {
		return horasDeSolQueTolera > 10
	}

	method anioDeObtencion() = anioDeObtencion

	method altura() = altura

	method esIdeal() = true

}

class Menta inherits Semillas {

	method horasDeSolQueTolera() = 6

	method daSemillas() = altura > 0.4

	method espacio() = altura * 3

	method esIdeal(parcela) = parcela.superficie() > 6

}

class Soja inherits Semillas {

	method horasDeSolQueTolera() {
		return if (altura < 0.5) {
			6
		} else {
			if (altura > 1) {
				9
			} else 7
		}
	}

	method daSemillas() = anioDeObtencion > 2007 && altura > 1

	method espacio() = altura / 2

	method esIdeal(parcela) = self.horasDeSolQueTolera() == parcela.horasDeSol()

}

class Quinoa inherits Semillas {
  //Se necesita saber el anio de obtencion.
    method horasDeSolQueTolera()= horasDeSolQueTolera
  
	method espacio() = 0.5

	method daSemillas() = anioDeObtencion < 2005

	method esIdeal(parcela) = parcela.plantas().all{ planta => planta.altura() < 1.5 }

}

class SojaTransgenica inherits Soja {

	override method daSemillas() = false

	override method esIdeal(parcela) = parcela.cantidadMaxima() == 1

}

class HierbaBuena inherits Menta {

	override method espacio() = (altura * 3) * 2

}

