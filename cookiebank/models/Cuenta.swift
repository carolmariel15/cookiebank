//
//  Cuenta.swift
//  cookiebank
//
//  Created by Carol Mariel
//

import Foundation

class Cuenta {

    var idCuenta: String
    var tipo: String
    var idTarjeta: String
    var dni: String
    var saldo: Double
    
    init(idCuenta: String, tipo: String, idTarjeta: String, dni: String, saldo: Double) {
        self.idCuenta = idCuenta
        self.tipo = tipo
        self.idTarjeta = idTarjeta
        self.dni = dni
        self.saldo = saldo
    }
    
    func toString() -> String {
       
        
        return "\(tipo) - \(idTarjeta) - \(saldo)"
    }
    
}
