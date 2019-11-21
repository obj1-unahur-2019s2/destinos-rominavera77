import socios.*
import talleresLiterarios.*

class Viaje {
	const property idiomas = []
	
	method implicaEsfuerzo()
	method sirveParaBroncearse()
	method cantidadDeDias()	
	method esInteresante(){ return idiomas.size() > 1}
	method esRecomendadaParaUnSocio(socio){
		return 	self.esInteresante() 
				and socio.leAtrae(self)
				and not socio.actividades().any({ actividad => actividad == self})
				// socio.actividades().all({ actividad => actividad != self})
	}
}
/* Actividades recomendadas para socios
Agregar la posibilidad de preguntar, 
* para una actividad, si es recomendada para un socio o no.

Para los viajes, se deben cumplir tres condiciones: 
* que la actividad sea interesante, que le atraiga al socio, 
* y que el socio no haya realizado ya la misma actividad. */

class ViajeDePlaya inherits Viaje{
	var property largoPlaya
	
	override method cantidadDeDias(){ return largoPlaya/500 }
	override method implicaEsfuerzo(){ return largoPlaya > 1200 }
	override method sirveParaBroncearse(){return true}
}

class ExcursionACiudad inherits Viaje{
	var property cantidadDeAtracciones = 0
	
	override method cantidadDeDias(){return cantidadDeAtracciones/2}
	override method implicaEsfuerzo(){ return cantidadDeAtracciones.between(5,8)}
	override method sirveParaBroncearse(){return false}
	override method esInteresante(){
		return super() or cantidadDeAtracciones == 5
	}
}

class ExcursionACiudadTropical inherits ExcursionACiudad{
	override method cantidadDeDias(){ return super() + 1}
	override method sirveParaBroncearse(){return true}
}

class SalidaDetrekking inherits Viaje{
	var property kmSenderos = 0
	var property diasDeSol = 0
	 
	override method cantidadDeDias(){return kmSenderos / 50 }
	override method implicaEsfuerzo(){ return kmSenderos > 80}
	override method sirveParaBroncearse(){
		return diasDeSol > 200 
		or diasDeSol.between(100,200)and kmSenderos > 120
	}
	override method esInteresante(){
		return super() and diasDeSol > 140
	}
}

class ClaseDeGimnasia inherits Viaje{
	
	override method idiomas(){ return ""}
	override method cantidadDeDias(){return 1}	
	override method implicaEsfuerzo(){return true}
	override method sirveParaBroncearse(){ return false}
	
}
/*Agregar al modelo las clases de gimnasia, 
 * que son otro tipo de actividad que la mutual ofrece a sus socios.
Se deben resolver las mismas cuatro preguntas que para los viajes,
*  que se responden así:
idiomas: en las clases de gimnasia se usa únicamente español.
OJO hay que devolver una colección con un único elemento.
Llevan 1 día.
Siempre implican esfuerzo, y nunca sirven para broncearse. */


/*Agregar al modelo la capacidad de preguntar si un viaje es interesante. 
 * Por lo general, la condición es que se use más de un idioma, 
 * p.ej. quechua y aymara, o francés, alemán y húngaro. 
 * Hay que contemplar estas variantes:
las excursiones a ciudad (tropical o no) se consideran interesantes 
* si se cumple la condición general, o bien, 
* se recorren exactamente 5 atracciones (ni más ni menos, exactamente 5).
las salidas de trekking se consideran interesantes 
* si se cumple la condición general,
*  y además en el lugar hay más de 140 días de sol por año. */

/*Salida de trekking
De cada salida de trekking se conoce cuántos kilómetros de senderos se van a recorrer caminando, 
* y cuántos días de sol por año tiene el lugar donde se va a hacer.
Los días que lleva una salida se calculan como kilometros de senderos / 50. 
* Una salida implica esfuerzo si se recorren más de 80 kilómetros, 
* y sirve para broncearse si en el lugar hay más de 200 días de sol por año, o hay entre 100 y 200,
*  y se recorren más de 120 kilómetros. */

/*Excursión a ciudad
De cada excursión a ciudad se informa cuántas atracciones se van a visitar. 
* Los días que lleva un viaje de este tipo se calculan como cantidad de atracciones / 2.
*  Una excursión implica esfuerzo si se visitan entre 5 y 8 atracciones, 
* y nunca sirve para broncearse.

Un caso especial son las excursiones a ciudad tropical. 
* Son como las excursiones a ciudad, con las siguientes variantes: 
* dura un día más que una excursión a ciudad de las mismas características, 
* y sí sirve para broncearse, siempre.
 * 
 * Viajes de playa.
De cada viaje de playa se informa el largo de la playa, medido en metros. 
* Para calcular cuántos días lleva un viaje de playa,
*  se hace esta cuenta: largo / 500. 
* Un viaje de playa implica esfuerzo si el largo de la playa supera los 1200 metros.
*  Todos los viajes de playa sirven para broncearse.
 
*/