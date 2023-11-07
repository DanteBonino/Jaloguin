class Barrio{
	const nenes
	
	method tridentePoderoso() = self.nenesPorCaramelos().take(3)
	
	method nenesPorCaramelos() = nenes.orderedBy{unNene, otroNene => unNene.tieneMasCaramelosQueOtro(otroNene)}
	
	method elemenosDeNenesConMuchosCaramelos(){
		const elementosUsadosPorNenesConMuchosCaramelos = new Set()
		self.nenesConMuchosCaramelos().forEach{unNene => elementosUsadosPorNenesConMuchosCaramelos.addAll(unNene.elementosPuestos())}
	}
	
	method nenesConMuchosCaramelos() = nenes.filter{unNene => unNene.tieneMasCaramelosQue(10)}
}

