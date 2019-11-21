import socios.*
import viajes.*

class TallerLiterario inherits Viaje{
	const property libros = []
	
	method idiomasUsados(){
		return libros.map({libro => libro.idioma()})
	}
	method diasQueLleva(){
		return libros.size() + 1
	}
	override method implicaEsfuerzo(){
		return libros.any({libro => libro.cantidadDePaginas()>=500})
			   or libros.all({libro => libro.autor()})
	}
	override method sirveParaBroncearse(){return false}
	override method esRecomendadaParaUnSocio(socio){
		return socio.idiomasQueHabla().size() >= 1
	}
}

class Libro{
	const property idioma
	const property cantidadDePaginas
	const property autor = ""
}
/*Agregar un nuevo tipo de actividad: el taller literario.
 *  De cada taller se registra sobre qué libros se trabaja.
 *  De cada libro se conoce: el idioma, la cantidad de páginas, 
 * y el nombre del autor.

Para un taller literario tenemos:

idiomas usados: los de los libros que se trabajan.
días que lleva: la cantidad de libros más uno.
implica esfuerzo: si incluye al menos un libro de más de 500 páginas, 
* o bien todos los libros son del mismo autor, 
* *****¿¿¿y hay más de uno.????******
sirve para broncearse: nunca.
es recomendado para un socio: 
* la condición es que el socio hable más de un idioma. */