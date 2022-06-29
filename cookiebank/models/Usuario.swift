//
//  Usuario.swift
//  cookiebank
//
//  Created by Carol Mariel
//

import Foundation

class Usuario {
    
    var dni: String
    var documentId: String
    var email: String
    var nombres: String
    var apellidos: String
    var claveInternet: String
    var celular: Int
    
    init(dni: String, documentId: String, email: String, nombres: String, apellidos: String, claveInternet: String, celular: Int) {
        self.dni = dni
        self.documentId = documentId
        self.email = email
        self.nombres = nombres
        self.apellidos = apellidos
        self.claveInternet = claveInternet
        self.celular = celular
    }
    
    
}
