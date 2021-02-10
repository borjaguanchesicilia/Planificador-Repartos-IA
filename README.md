#  Planificador de reparto PROLOG (IA)

* **OBJETIVO:**

	* El objetivo fue la creación de un sistema basado en el conocimiento usando
el lenguaje de programación declarativo y lógico Prolog (***PRO****grammation* en
***LOG****ique*) para que dé respuesta a la resolución de un problema.

* **IDEA:**

	* Se ha desarrollado un planificador de repartos para una cadena de
supermercados que da respuesta a: ***“dada una lista con los productos asignados a un
reparto, se devuelve un manifiesto de carga”.***

	* Para ello, se tiene una base de conocimiento de los productos con los que opera
esa cadena de supermercados, divididos por familias, así como las sedes de los
supermercados junto a la distancia entre el Hub y la sede. 

	* Además se incluyen una
serie de restricciones de acuerdo a la orden dentro del camión que tiene que tener
los palets, así como una colección de recomendaciones y restricciones para
determinar el tipo de camión más adecuado dada la lista total de productos y las sedes
para abastecer.

* **FUNCIONAMIENTO:**

	* **1.** Se llama al predicado general, pasándole la lista de productos y la
lista de sedes a las que hay que ir.

	* **2.** Se pasa la lista de productos por un predicado que verifica si cada
producto del manifiesto existe en la base de conocimiento.

	* **3.** Si se cumple este predicado, se coge la lista de productos y se
permuta de todas las maneras posibles y para cada una de ellas se llama al
predicado planificador, pasándole dicho orden de productos.

	* **4.** Una vez cumplida la primera comprobación de que los productos
existen, se pasa a comprobar con el predicado adyacente si el orden que tiene la
lista es correcto, verificando la no adyacencia entre productos de tipo sensible y/o
frescos con productos nocivos.

	* **5.** A continuación se comprueba mediante el predicado sedes si las
sedes a las que hay que abastecer son correctas. De verificarse, se obtiene la
distancia total que tiene que hacer el transportista.

	* **6.** Se calcula el número total de palets que el operario deberá de
trasladar (mediante el conteo de palets en la lista de productos).

	* **7.** Se comprueba que los palets no son más de 30.

	* **8.** Se comprueba que la distancia a recorrer no es más de 300 km.

	* **9.** Se obtiene una recomendación del mejor tipo de camión, de
acuerdo con el número de palets a transportar y la distancia a recorrer.

	* **10.** Se devuelve una lista con la información obtenida para cada una de
las posibles combinaciones en las que se puede transportar la carga.
