//
//  Cuenta.swift
//  cookiebank
//
//  Created by Carol Mariel
//

import Foundation

class Cuenta {

    var idCuenta: Int
    var tipo: String
    var idTarjeta: Int
    var dni: String
    var saldo: Double
    
    init(idCuenta: Int, tipo: String, idTarjeta: Int, dni: String, saldo: Double) {
        self.idCuenta = idCuenta
        self.tipo = tipo
        self.idTarjeta = idTarjeta
        self.dni = dni
        self.saldo = saldo
    }
    
}
