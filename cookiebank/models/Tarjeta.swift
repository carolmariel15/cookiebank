//
//  Tarjeta.swift
//  cookiebank
//
//  Created by Carol Mariel
//

import Foundation

class Tarjeta {
    
    var idTarjeta: String
    var tipo: String
    var clave: Int
    var fchVencimiento: String
    var fchRegistro: String
    var cvc: Int
    var dni: String
    init(idTarjeta: String, tipo: String, clave: Int, fchVencimiento: String, fchRegistro: String, cvc: Int, dni: String) {
        self.idTarjeta = idTarjeta
        self.tipo = tipo
        self.clave = clave
        self.fchVencimiento = fchVencimiento
        self.fchRegistro = fchRegistro
        self.cvc = cvc
        self.dni = dni
    }
    
    func toString() -> String {
        return "Tarjeta:\(idTarjeta) - \(tipo) - \(fchVencimiento) - \(fchRegistro)"
    }
    
    
}
