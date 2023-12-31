/* Estados de Salud */

class Estado{
	var caramelosComidos = 0
	const actitud = (1..10).anyOne()
	
	method actitud(unaPersona) = actitud * self.factorDeActitud()
	
	method factorDeActitud() = 1
	
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
}


class Empachado inherits Estado{
	override method estadoNuevo() = enCama
	
	override method factorDeActitud() = super()/2
}

object enCama{
	method comer(unaPersona, unaCantidad){
		/* No hace nada */
	}
	
	method actitud() = 0
}
