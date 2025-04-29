object paqute {
  var estaPago = false
  var destino = laMatrix
  method estaPago() = estaPago
  method pagarPaquete()  = estaPago = true
  method puedeEntregarse() {return destino.dejarPasar(unMensajero) &&
                            self.estaPago()}

  method precioTotal() = 50                         
}


object puenteDeBrooklyn {
  method dejarPasasr(unMensajero) {
         unMensajero.peso() < 1000
    
  }
}

object laMatrix {
  method dejarPasar(unMensajero) {
         unMensajero.puedeLlamar()
  }
}

object roberto {
  var transporte = bicicleta
  method peso() = 90 + transporte.peso()
  method puedeLlamar() = false
  method cambiarTransporte(nuevoTransporte) {
         transporte = nuevoTransporte
  }
}

object chuckNorris {
  method peso() = 80
  method puedeLlamar() = true
}
object neo {
  var tieneCredito = true
  method peso() = 0
  method puedeLlamar() = tieneCredito
  method cargarCredito() {tieneCredito = true}
  method agotarCredito() {tieneCredito = false}
}

object bicicleta {
  method peso() = 5
}
object camion {
  var aclopados = 1
  method peso() = aclopados * 500
  method cantidadDeAclopados(unaCantidad) {aclopados = unaCantidad}
}

object empresaMensajeria {
    const mensajeros = []
    const paquetesPendientes = []
    method mensajeros() = mensajeros
    method contratar(unMensajero) {
        mensajeros.add(unMensajero)
      
    }
    method despedir(unMensajero) {
        mensajeros.remove(unMensajero)
      
    }
    method esGrande() {
        mensajeros.size() > 2
      
    }
    method puedeEntregarPaquete() {return paqute.puedeEntregarse(mensajeros.first())}
    method pesoUltimoMensajero() = mensajeros.last().peso()
    method puedeEntregarse(unPaquete) {
      return
      mensajeros.any({m => unPaquete.puedeEntregarse(m)})
    }
    method losQuePuedeEntregar(unPaquete) {
        return
        mensajeros.filter({m => unPaquete.puedeEntregarse()})
      
    }
    method tieneSobrePeso() {
        return
        self.pesoDeLosMensajeros() / mensajeros.size() > 500
      
    }
    method pesoDeLosMensajeros() = mensajeros.sum({m => m.peso()})
    method enviar(unPaquete) {
        if (self.puedeEntregarse(unPaquete)){
            paquetesEnviados.add(unPaquete)
        }
        else{
            paquetesPendientes.add(unPaquete)
        }
      
    }
    method facturacion() = paquetesEnviados.sum({p => p.precioTotal()})
    method enviarPaquetes(listaDePaaquetes) {
        listaDePaaquetes.forEach({p => self.enviar(p)})
      
    }
    method enviarPendientesMasCaro() {
      
      if(self.puedeEntregarse(self.paqueteMasCaroPendiente())){
      self.enviar(self.paqueteMasCaroPendiente())
      paquetesPendientes.remove(self.paqueteMasCaroPendiente())
      }
    }
    method paqueteMasCaroPendiente() {
        return 
        paquetesPendientes.max({p =>p.precioTotal()})
      
    }

      
    
}
object paqueton {
  var importePagado= 0
  const destnos = []
  method agregarDestinos(unDestino) {
    destnos.add(unDestino)
    
  }
  method precioTotal() = 100 * destnos.size()
  method pagar(unImporte) {return importePagado = importePagado}...
  method estaPago(){return importePagado >= self.precioTotal()}
  method puedeEntregarse(unMensajero){
    return
    self.estaPago() && self.puedePasarPorDestinos(unMensajero)....
  } 
  method puedePasarPorDestinos() {
    return
    destnos.all({d => d.dejarPasar(unMensajero)})..
  }
}
object paqutito {
    method estaPago() = true
    method puedeEntregarse(unMensajero) = true
    method precio() = 0
  
}