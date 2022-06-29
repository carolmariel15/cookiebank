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
    var fchRegistro: Date
    var cvc: Int
    
    init(idTarjeta: String, tipo: String, clave: Int, fchVencimiento: String, fchRegistro: Date, cvc: Int) {
        self.idTarjeta = idTarjeta
        self.tipo = tipo
        self.clave = clave
        self.fchVencimiento = fchVencimiento
        self.fchRegistro = fchRegistro
        self.cvc = cvc
    }
    
    
}
