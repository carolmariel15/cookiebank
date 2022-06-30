//
//  Tarjetas.swift
//  cookiebank
//
//  Created by piero on 6/30/22.
//

import Foundation

class Tarjetas {
    
    var idtarjetas: Int
    var tipo: String
    var clave: Int
    var fchVencimiento: String
    var fchRegistro: String
    var cvc: Int
    var dni: String
    
    init(idtarjetas: Int, tipo: String, clave: Int, fchVencimiento: String, fchRegistro: String,cvc: Int,dni: String){
        
        self.idtarjetas = idtarjetas
        self.tipo = tipo
        self.clave = clave
        self.fchVencimiento = fchVencimiento
        self.fchRegistro = fchRegistro
        self.cvc = cvc
        self.dni = dni
        
    }
    
    func toString() -> String {
        return "Tarjeta:\(idtarjetas) - \(fchVencimiento) - \(tipo) NRO TARJETA: \(fchRegistro)"
    }
    
    
    
}


