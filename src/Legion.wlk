import Chico.*

object legionCreator{
	method create (unosNenes){
		self.validarPosibilidadDeCrear(unosNenes)
		return new Legion(miembros = unosNenes)
	}
	
	method validarPosibilidadDeCrear(unosNenes){
		if(unosNenes.size() < 2) throw new Exception(message = "No hay suficientes miembros")
	}
}


