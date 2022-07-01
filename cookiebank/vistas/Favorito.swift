//
//  Favorito.swift
//  cookiebank
//
//  Created by piero on 6/30/22.
//

import Foundation
class Favorito {
    
    var idfavorito: Int
    var nrocuenta: String
    var descripcion: String
    var fecha: String
    var dni:String
    
    
    init(idfavorito: Int, nrocuenta: String, descripcion: String, fecha: String, dni:String){
        
        self.idfavorito = idfavorito
        self.nrocuenta = nrocuenta
        self.descripcion = descripcion
        self.fecha = fecha
        self.dni = dni
    
        
    }
    
    func toString() -> String {
        return "Tarjeta:\(idfavorito) - \(fecha) - \(descripcion) Cuenta: \(nrocuenta)"
    }
    
    
    
}
