//
//  MenuViewController.swift
//  cookiebank
//
//  Created by Carol Mariel
//

import UIKit

class MenuViewController: UIViewController {
    
    private let usuario: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.buscarDniUsuario()

    }
    
    func buscarDniUsuario() {
        if let value = UserDefaults.standard.string(forKey: usuario) {
            print(value)
        } else {
            print("no llego :(")
        }
        
    }
    
    @IBAction func cerrarSesion(_ sender: Any) {
        let alert = UIAlertController(title: "Cerrar sesion", message: "¿Seguro que desea cerrar sesion?", preferredStyle: .alert)
        
        let aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: {_ in
            UserDefaults.standard.removeObject(forKey: self.usuario)
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
