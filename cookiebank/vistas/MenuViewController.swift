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
    private var documentUsu: String = ""
    
    var dniList = [String]()
    var documentList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.buscarDniUsuario()
    }
    
    func buscarDniUsuario() {
        if let email = UserDefaults.standard.string(forKey: self.usuario) {
    
            Firestore.firestore().collection("usuario").whereField("email", isEqualTo: email).getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("No se encontro el usuario")
                } else {
                    for document in querySnapshot!.documents {
                        let dni = document.data()["dni"] as! String
                        let doc = document.documentID
                        self.dniList.append(dni)
                        self.documentList.append(doc)
                    }
                }
            }
            UserDefaults.standard.removeObject(forKey: self.usuario)
            UserDefaults.standard.set(self.dniList[0], forKey: self.dni)
            UserDefaults.standard.set(self.documentList[0], forKey: self.documentUsu)
            UserDefaults.standard.synchronize()
            
            print("dni \(self.dniList[0])")
            print("document \(self.documentList[0])")
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
