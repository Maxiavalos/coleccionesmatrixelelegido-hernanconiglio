object neo {
	var energia = 100
	method esElElegido() = true
	method energia() = energia
	method saltar() {energia *= 0.5}
	method vitalidad() = energia / 10
}

object morfeo {
	var property vitalidad = 8
	var estaCansado = false
	method estaCansado() = estaCansado
	method esElElegido() = false
	method saltar() {
		estaCansado = not estaCansado
		vitalidad = 0.max(vitalidad-1)
	}
}

object triniti {
	method vitalidad() = 0
	method esElElegido() = false
	method saltar() {}
	
}

object nave {
	var pasajeros = [neo,triniti,morfeo]
	
	method cantidadPasajeros() = pasajeros.size()
	method estaElElegido() = 
		pasajeros.any( { p => p.esElElegido() } )
		
	method chocar() {
		pasajeros.forEach( { p => p.saltar() } )
		pasajeros.clear()
	}
	
	method acelerar() {
		pasajeros.filter( { p => not p.esElElegido() } )
		.forEach( { p => p.saltar() } )
	}

	method acelerarv2() {
		pasajeros.forEach( { p => if(not p.esElElegido()) {p.saltar()} } )
	}

	method noElegidos() = pasajeros.filter( { p => not p.esElElegido() } )
	
	method acelerarOptimo() {
		self.noElegidos().forEach( { p => p.saltar() } )
	}
	
	method estaEquilibrada() {
		return self.mayorVitalidad().vitalidad() < 
			self.menorVitalidad().vitalidad() * 2 
	}
	
	method mayorVitalidad() = pasajeros.max( { p => p.vitalidad() } )
	method menorVitalidad() = pasajeros.min( { p => p.vitalidad() } )
}
