import EstadoSalud.*
class Chico inherits Asustador{
	const property elementosPuestos = new Set()
	var caramelos = 0
	var property estado = new Sano()
	
	/* Punto 1 Parte a */
	override method capacidadDeSusto() = self.actitud() * self.sustoDeElementosPuestos()
	
	method actitud() = estado.actitud()
	
	method sustoDeElementosPuestos() = elementosPuestos.sum{unElemento => unElemento.sustoGenerado()}
	
	/* Punto 2 Parte a */
	
	
	
	override method recibirCaramelos(unaCantidad){
		caramelos += unaCantidad
	}
	
	override method caramelos() = caramelos
	
	method tieneMasCaramelosQueOtro(otroNene) = self.caramelos() > otroNene.caramelos()
	
	method alimentarse(unaCantidad){
		estado.comer(self, unaCantidad)
	}
	
	method  validarQuePuedaComer(unaCantidad){
		if(unaCantidad > self.caramelos()) throw new Exception (message = "No tiene suficientes caramelos")
	}
}


class Legion inherits Asustador{
	const miembros
	
	override method capacidadDeSusto() = miembros.sum{unMiembro => unMiembro.capacidadDeSusto()}
	
	override method caramelos() = miembros.sum{unMiembro => unMiembro.caramelos()}
	
	method lider() = miembros.max{unMiembro => unMiembro.capacidadDeSusto()}
	
	override method recibirCaramelos(unaCantidad) = self.lider().recibirCaramelos(unaCantidad)
}


class Asustador{
	method capacidadDeSusto()
	
	method caramelos()
	
	method intentarAsustarA(unAdulto){
		unAdulto.serAsustadoPor(self)
	}
	
	method recibirCaramelos(_unaCantidad)
	
	method tieneMuchosCaramelos() = self.tieneMasCaramelosQue(15)
	
	method tieneMasCaramelosQue(unaCantidad) = self.caramelos() > unaCantidad
}



