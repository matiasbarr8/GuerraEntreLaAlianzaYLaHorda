import example.*
class Localidad {
    var property ejercito = new Ejercito ()
    method enlistar(unPersonaje){
        ejercito.agregarPersonaje(unPersonaje)
    }
    method poderDefensivo() = ejercito.potencial()
    method serOcupada(unEjercito)
}

class Aldea inherits Localidad{
    const cantMaxima
    override method enlistar(unPersonaje) {
      if(ejercito.personajes().size()>=cantMaxima){
        self.error("Se alcanzo el limite maximo")
      }
      super(unPersonaje)
    }
    override method serOcupada(unEjercito){
        ejercito.clear()
        unEjercito.los10MasPoderosos().forEach({
            p => self.enlistar(p)
        })
        unEjercito.quitarLosMasFuertes(cantMaxima.min(10))
    }
}
class Ciudad inherits Localidad{
    override method poderDefensivo() = super() + 300
    override method serOcupada(unEjercito){
        ejercito = unEjercito
    }
}
class Ejercito{
    const property personajes = #{}

    method agregarPersonaje(unPersonaje){
        personajes.add(unPersonaje)
    }
    method potencial() = personajes.sum({p => p.potencialOfensivo()})
    method invadir(unaLocalidad){
        if(self.puedeInvadir(unaLocalidad)){
            unaLocalidad.serOcupada(self)
        }
    }
    method puedeInvadir(unaLocalidad) = self.potencial() > unaLocalidad.poderDefensivo()
    method los10MasPoderosos() = self.listaOrdenadaPorPoder().take(10)
    method listaOrdenadaPorPoder() {
      return personajes.asList().sortBy({p1,p2 => p1.potencialOfensivo() > p2.potencialOfensivo()})
    }
    method quitarLosMasFuertes(cantAQuitar){
        personajes.removeAll(self.los10MasPoderosos().take(cantAQuitar))
    }
}