object salaComun {

  var espectadores = 150

  var precio = 8000



  method espectadores() = espectadores

  method capacidad() = 200

  method precio() = precio



  method recaudacion() = espectadores * precio



  method porcentajeOcupacion() =

    espectadores * 100 / self.capacidad()



  method estaCompleta() =

    espectadores == self.capacidad()



  method aumentarPrecio(porcentaje) {

    precio = precio * (100 + porcentaje) / 100

  }

}



object cine {

  const salas = #[salaComun, salaPremium, sala3D]



  method recaudacionTotal() =

    salas.sum({ sala => sala.recaudacion() })



  method salaQueMasRecauda() =

    salas.max({ sala => sala.recaudacion() })



  method salasConAltaOcupacion() =

    salas.filter({ sala => sala.porcentajeOcupacion() > 80 })



  method existeSalaCompleta() =

    salas.any({ sala => sala.estaCompleta() })



  method cantidadTotalEspectadores() =

    salas.sum({ sala => sala.espectadores() })



  method porcentajePromedioOcupacion() =

    salas.sum({ sala => sala.porcentajeOcupacion() }) / salas.size()



  method aumentarPrecioEntradas(porcentaje) {

    salas.forEach({ sala => sala.aumentarPrecio(porcentaje) })

  }

}























test "recaudacion de una sala" {

  assert.equals(1200000, salaComun.recaudacion())

}



test "recaudacion total del cine" {

  assert.equals(

    salaComun.recaudacion() +

    salaPremium.recaudacion() +

    sala3D.recaudacion(),

    cine.recaudacionTotal()

  )

}



test "sala que mas recauda" {

  assert.equals(

    salaComun,

    cine.salaQueMasRecauda()

  )

}
















object salaComun {
    var espectadores = 0
    var capacidad = 200
    var precioEntrada = 8000
}

object salaPremium {
    var espectadores = 0
    var capacidad = 120
    var precioEntrada = 10000
}

object sala3D {
    var espectadores = 0
    var capacidad = 80
    var precioEntrada = 15000
}

object cine {
    const salas = #[salaComun, salaPremium, sala3D]





























555555555555












object salaComun {
  var precioEntrada = 8000
  var espectadores = 0
  const capacidadMax = 200

  method precioEntrada() = precioEntrada
  method precioEntrada(nuevoPrecio) { precioEntrada = nuevoPrecio }
  
  method espectadores() = espectadores
  method espectadores(nuevaCantidad) { espectadores = nuevaCantidad }

  method capacidadMax() = capacidadMax

  method recaudacion() = espectadores * precioEntrada

  method porcentajeOcupacion() = (espectadores / capacidadMax) * 100

  method estaCompleta() = espectadores >= capacidadMax

  method aumentarPrecio(porcentaje) {
    precioEntrada = precioEntrada * (1 + porcentaje / 100)
  }
}

object salaPremium {
  var precioEntrada = 10000
  var espectadores = 0
  const capacidadMax = 120

  method precioEntrada() = precioEntrada
  method precioEntrada(nuevoPrecio) { precioEntrada = nuevoPrecio }
  
  method espectadores() = espectadores
  method espectadores(nuevaCantidad) { espectadores = nuevaCantidad }

  method capacidadMax() = capacidadMax

  method recaudacion() = espectadores * precioEntrada

  method porcentajeOcupacion() = (espectadores / capacidadMax) * 100

  method estaCompleta() = espectadores >= capacidadMax

  method aumentarPrecio(porcentaje) {
    precioEntrada = precioEntrada * (1 + porcentaje / 100)
  }
}

object sala3D {
  var precioEntrada = 15000
  var espectadores = 0
  const capacidadMax = 80

  method precioEntrada() = precioEntrada
  method precioEntrada(nuevoPrecio) { precioEntrada = nuevoPrecio }
  
  method espectadores() = espectadores
  method espectadores(nuevaCantidad) { espectadores = nuevaCantidad }

  method capacidadMax() = capacidadMax

  method recaudacion() = espectadores * precioEntrada

  method porcentajeOcupacion() = (espectadores / capacidadMax) * 100

  method estaCompleta() = espectadores >= capacidadMax

  method aumentarPrecio(porcentaje) {
    precioEntrada = precioEntrada * (1 + porcentaje / 100)
  }
}

object cine {
  const salas = #{salaComun, salaPremium, sala3D}

  method salas() = salas

  method recaudacionTotal() = salas.sum({ sala => sala.recaudacion() })

  method salaQueMasRecauda() = salas.max({ sala => sala.recaudacion() })

  method salasAltaOcupacion() = salas.filter({ sala => sala.porcentajeOcupacion() > 80 })

  method existeSalaCompleta() = salas.any({ sala => sala.estaCompleta() })

  method totalEspectadores() = salas.sum({ sala => sala.espectadores() })

  method porcentajePromedioOcupacion() = salas.sum({ sala => sala.porcentajeOcupacion() }) / salas.size()

  method aumentarPrecioTodasLasSalas(porcentaje) {
    salas.forEach({ sala => sala.aumentarPrecio(porcentaje) })
  }
}





import cine.*

describe "Tests de Administración de Salas (Parte 1) - Sin Property" {

  method initialize() {
    salaComun.espectadores(100)
    salaPremium.espectadores(60)
    sala3D.espectadores(80)
  }

  test "Obtención correcta de la recaudación de una sala" {
    assert.equals(800000, salaComun.recaudacion())
    assert.equals(600000, salaPremium.recaudacion())
    assert.equals(1200000, sala3D.recaudacion())
  }

  test "Obtención de la recaudación total del cine" {
    assert.equals(2600000, cine.recaudacionTotal())
  }

  test "Obtención de la sala que más recauda" {
    assert.equals(sala3D, cine.salaQueMasRecauda())
  }

  test "Obtención de salas con alta ocupación (superior al 80%)" {
    assert.equals(#{sala3D}, cine.salasAltaOcupacion())
  }

  test "Detección de salas completas en el cine" {
    assert.that(cine.existeSalaCompleta())
  }

  test "Verificación de estadísticas globales (espectadores y promedio)" {
    assert.equals(240, cine.totalEspectadores())
    assert.equals(200 / 3, cine.porcentajePromedioOcupacion())
  }

  test "Aumento del precio de todas las salas" {
    cine.aumentarPrecioTodasLasSalas(10)
    
    assert.equals(8800, salaComun.precioEntrada())
    assert.equals(11000, salaPremium.precioEntrada())
    assert.equals(16500, sala3D.precioEntrada())
  }

  test "Verificación del comportamiento luego de modificar su estado" {
    sala3D.espectadores(0)
    salaComun.espectadores(200)

    assert.equals(salaComun, cine.salaQueMasRecauda())
    assert.equals(#{salaComun}, cine.salasAltaOcupacion())
    assert.that(cine.existeSalaCompleta())
  }
}


}