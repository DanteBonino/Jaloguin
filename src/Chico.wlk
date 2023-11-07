class Chico inherits Asustador{
	const actitud = (1..10).anyOne()
	const property elementosPuestos = new Set()
	var caramelos = 0
	var property estado = new Sano()
	
	/* Punto 1 Parte a */
	override method capacidadDeSusto() = self.actitud() * self.sustoDeElementosPuestos()
	
	method actitud() = actitud
	
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

/* Adultos */

class Adulto{
	method serAsustadoPor(unAsustador){
		if(self.seAsustaPor(unAsustador)) self.entregarCaramelosA(unAsustador)
	}
	
	method seAsustaPor(unAsustador)
	
	method entregarCaramelosA(unAsustador){
		unAsustador.recibirCaramelos(self.cantidadDeCaramelos())
	}
	
	method cantidadDeCaramelos()
}

class Comun inherits Adulto{
	var cantidadDeNenesConMuchosCaramelosQueIntentaronAsustarlo
	
	override method seAsustaPor(unAsustador){
		self.chequearQueSiTieneMuchosCaramelos(unAsustador)
		return self.tolerancia() < unAsustador.capacidadDeSusto()
	}
	
	override method cantidadDeCaramelos() = self.tolerancia()/2
		
	method chequearQueSiTieneMuchosCaramelos(unAsustador){
		if(unAsustador.tieneMuchosCaramelos()) cantidadDeNenesConMuchosCaramelosQueIntentaronAsustarlo ++
	}
	
	method tolerancia() = 10 * cantidadDeNenesConMuchosCaramelosQueIntentaronAsustarlo
}

class Abuelo inherits Adulto{

	override method seAsustaPor(_unAsustador) = true
	
	override method cantidadDeCaramelos() = 0 /* No se qué hacer */
	
}

class Necio inherits Adulto{
	override method seAsustaPor(_unAsustador) = false
	
	override method cantidadDeCaramelos() = 0
}

/* Estados de Salud */

class Estado{
	var caramelosComidos = 0
	const actitud = (1..10).anyOne()
	
	method actitud(unaPersona) = actitud * self.factorDeActitud()
	
	method factorDeActitud()
	
	method comer(unaPersona, unaCantidad){
		unaPersona.validarQuePuedaComer(unaCantidad)
		self.registrarAlimento(unaCantidad, unaPersona)
		unaPersona.recibirCaramelos(-unaCantidad)
	}
	
	method registrarAlimento(unaCantidad, unaPersona){
		caramelosComidos += unaCantidad
		if(caramelosComidos >= 10) unaPersona.estado(self.estadoNuevo())
	}
	
	method estadoNuevo()
}

class  Sano inherits Estado{
	override method estadoNuevo() = new Empachado()
	
	override method factorDeActitud() = 1
}


class Empachado inherits Estado{
	override method estadoNuevo() = enCama
	
	override method factorDeActitud() = 2
}

object enCama{
	method comer(unaPersona, unaCantidad){
		/* No hace nada */
	}
}

