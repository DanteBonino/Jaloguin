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