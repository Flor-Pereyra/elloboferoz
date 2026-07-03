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
}