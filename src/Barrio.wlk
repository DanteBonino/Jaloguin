class Barrio{
	const nenes = new Set()
	
	method tridentePoderoso() = self.nenesPorCaramelos().take(3)
	
	method nenesPorCaramelos() = nenes.orderedBy{unNene, otroNene => unNene.tieneMasCaramelosQueOtro(otroNene)}
	
	method elemenosDeNenesConMuchosCaramelos(){
		return self.nenesConMuchosCaramelos().flatMap({unNene => unNene.elementosPuestos()}).asSet()
	}
	
	method nenesConMuchosCaramelos() = nenes.filter{unNene => unNene.tieneMasCaramelosQue(10)}
}

