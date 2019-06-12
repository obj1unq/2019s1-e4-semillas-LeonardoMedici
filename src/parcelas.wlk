import semillas.*

class Parcela {

	const property plantas = []
	var property ancho
	var property largo
	var property horasDeSol
	var property esEcologica = true
	var esIndustrial = not esEcologica

	method esIndustrial() = esIndustrial

	method superficie() = ancho * largo

	method cantidadMaxima() = if (ancho > largo) {
		self.superficie() / 5
	} else {
		self.superficie() / 3 + largo
	}

	method tieneComplicaciones() {
		return plantas.any{ planta => planta.horasDeSolQueTolera() < horasDeSol }
	}

	method plantar(planta) {
		plantas.add(planta)
		if (self.cantidadMaxima() < plantas.size() || (horasDeSol - planta.horasDeSolQueTolera()) >= 2) {
			self.error("Supera el numero maximo de plantas o la planta no tolera el sol")
		}
	}

	method seAsociaBien(planta) {
		return if (self.esEcologica()) {
			not self.tieneComplicaciones() && planta.esIdeal()
		} else {
			plantas.size() == 2 && planta.esFuerte()
		}
	}

	method plantasAsociadasBien() {
		return plantas.count{ planta => self.seAsociaBien(planta) }
	}

}

object inta {

	const property parcelas = []

	method promedioDePlantas() {
		return parcelas.sum({ parcela => parcela.plantas().size() }) / parcelas.size()
	}

	method parcelaConMasDe4Plantas() {
		return (parcelas.filter{ parcela => parcela.plantas().size() > 4 })
	}

	method laMasAutosustentable() {
		return self.parcelaConMasDe4Plantas().max({ parcela => parcela.plantasAsociadasBien() })
	}

}

