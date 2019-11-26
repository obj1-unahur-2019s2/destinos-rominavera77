import viajes.*
import talleresLiterarios.*

class Socio {
	const property actividades = []
	var property maximoDeActividades = 0
	var property edad = 0

	
	method esAdoradorDelSol(){ 
		return actividades.all({actividad => actividad.sirveParaBroncearse()})
	}	
	method actividadesEsforzadas(){ 
		return actividades.filter({actividad => actividad.implicaEsfuerzo()})
	}
	method realizoUnaActividad(actividad){ 
		actividades.add(actividad)
	}
	method llegoAlMaximoDeAtividades(){
		 if(self.llegoAlMaximo()){
			self.error("No podes hacer mas actividades")
		}
	}
	method llegoAlMaximo(){
		return actividades.size() == maximoDeActividades
	}
	method leAtrae(actividad){return self.actividades() }
}

class SocioTranquilo inherits Socio{
	override method leAtrae(actividad){ 
		return actividad.cantidadDeDias() >= 4
	}
}

class SocioCoherente inherits Socio{
	override method leAtrae(actividad){
		if(self.esAdoradorDelSol()){return actividad.sirveParaBroncearse()}
		else return actividad.implicaEsfuerzo()
	}
}

class SocioRelajado inherits Socio{
	/*P.ej. si un socio relajado habla español y quechua, 
* entonces una actividad en español le va a atraer, una en quechua y aymará también, 
* una en francés e italiano no. */ 
	const property idiomasQueHabla = []
	
	override method leAtrae(actividad){
		return idiomasQueHabla.any({unIdioma =>
			actividad.usaElIdioma(unIdioma)
		})
	}
}
/*Se debe agregar al modelo la pregunta de si una actividad le atrae a un socio o no.
Para ello, se debe agregar para cada socio, la edad, 
* y la colección de idiomas que habla (en realidad, 
* la edad se usa recién en el punto siguiente, pero cuesta poco agregarla ahora).
La condición depende del tipo de socio, de acuerdo a lo siguiente:
si es un socio tranquilo, entonces la condición es que la actividad 
* lleve 4 días o más.
si es un socio coherente, entonces: si es adorador del sol, 
* entonces la actividad debe servir para broncearse, 
* si no, debe implicar esfuerzo.
si es un socio relajado, la condición es hablar al menos uno 
* de los idiomas que se usan en la actividad. 
* ---------------------------------------------------------------------------------------
* ///////////////////////////////////////////////////////////////////////////
* P.ej. si un socio relajado habla español y quechua, 
* entonces una actividad en español le va a atraer, una en quechua y aymará también, 
* una en francés e italiano no. */



/*Agregar al modelo los socios. De cada socio se debe registrar qué actividades realizó,
 *  que pueden ser viajes o clases de gimnasia. 
 * Para cada socio se establece también un máximo de actividades que puede hacer.

Se debe resolver, para un socio:

si es, o no, adorador del sol. 
* La condición es que todas actividades que realizó sirven para broncearse.
la colección de actividades esforzadas, o sea, las actividades que realizó que implican esfuerzo.
registrar que realiza una actividad. 
* Si ya llegó al máximo de actividades que puede hacer, hay que lanzar error. */