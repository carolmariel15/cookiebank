//
//  MenuViewController.swift
//  cookiebank
//
//  Created by Carol Mariel
//

import UIKit
import FirebaseFirestore

class MenuViewController: UIViewController {
    
    private let usuario: String = ""
    private var dni: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.buscarDniUsuario()

    }
    
    func buscarDniUsuario() {
        if let email = UserDefaults.standard.string(forKey: usuario) {
    
            Firestore.firestore().collection("usuario").whereField("email", isEqualTo: email).getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("No se encontro el usuario")
                } else {
                    for document in querySnapshot!.documents {
                        self.dni = document.data()["dni"] as! String
                    }
                }
            }
            UserDefaults.standard.removeObject(forKey: self.usuario)
            UserDefaults.standard.set(dni, forKey: self.dni)
            UserDefaults.standard.synchronize()
            print(dni)
        } else {
            print ("Email es null")
        }
    }
    
    @IBAction func cerrarSesion(_ sender: Any) {
        let alert = UIAlertController(title: "Cerrar sesion", message: "¿Seguro que desea cerrar sesion?", preferredStyle: .alert)
        
        let aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: {_ in
            UserDefaults.standard.removeObject(forKey: self.dni)
            UserDefaults.standard.synchronize()
            
            self.volverLogin()
        })
        
        let cancelar = UIAlertAction(title: "Cancelar", style: .default)
        
        alert.addAction(aceptar)
        alert.addAction(cancelar)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func volverLogin(){
        let vc = self.storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
