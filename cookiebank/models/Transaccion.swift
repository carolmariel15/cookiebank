//
//  Transaccion.swift
//  cookiebank
//
//  Created by Carol Mariel
//

import Foundation

class Transaccion {
    
    var idTransac: Int
    var idCuentaOrigen: Int
    var idCuentaDestino: Int
    var tipoOperacion: String
    var fchTransac: Date
    var monto: Double
    
    init(idTransac: Int, idCuentaOrigen: Int, idCuentaDestino: Int, tipoOperacion: String, fchTransac: Date, monto: Double) {
        self.idTransac = idTransac
        self.idCuentaOrigen = idCuentaOrigen
        self.idCuentaDestino = idCuentaDestino
        self.tipoOperacion = tipoOperacion
        self.fchTransac = fchTransac
        self.monto = monto
    }
    
}
