class Raza{
  const property fuerza
  const property inteligencia
  var rol


  method cambiarRol(nuevoRol) {
    rol = nuevoRol
  }
  method potencialOfensivo() = fuerza * 10 + rol.valorExtra()
  method esInteligente()
  method esGroso() = self.esInteligente() || rol.esGroso(self)
}
class Orco inherits Raza {
  override method potencialOfensivo() = super() + rol.brutalidadInnata(super())

  override method esInteligente() = false
}
class Humano inherits Raza{
  override method esInteligente() = inteligencia > 50
}

class Mascota{
  const fuerza
  const edad
  const tieneGarras

  method initialize(){
    if(fuerza > 100){
      self.error("La mascota no puede tener una fuerza mayor a 100")
    }
    else if(edad < 0){
      self.error("La edad no puede ser negativa")
    }
  }
  method edad() = edad
  method potencialOfensivo() = if(tieneGarras)fuerza * 2 else fuerza
  method esLongeva() = self.edad() > 10
}

class RolCazador {
  var mascota = new Mascota(fuerza=0,edad=0,tieneGarras=false)

  method cambiarMascota(nuevaMascota) {
    mascota = nuevaMascota
  }
  method naceNuevaMascota(fuerza,edad,tieneGarras){
    mascota = new Mascota(fuerza=fuerza,edad=edad,tieneGarras=tieneGarras)
  }
  method valorExtra() = mascota.potencialOfensivo()
  method brutalidadInnata(unValor) = 0
  method esGroso(unPersonaje) = mascota.esLongeva()
}
object rolGuerrero {
  method valorExtra() = 100
  method brutalidadInnata(unValor) = 0
  method esGroso(unPersonaje) = unPersonaje.fuerza() > 50
}
object rolBrujo {
  method valorExtra() = 0
  method brutalidadInnata(unValor) = unValor * 0.1
  method esGroso(unPersonaje) = true
}