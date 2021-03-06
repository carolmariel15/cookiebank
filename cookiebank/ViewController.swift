//
//  ViewController.swift
//  cookiebank
//
//  Created by Carol Mariel on 19/06/22.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtClave: UITextField!
    @IBOutlet weak var btnIngresar: UIButton!
    
    private let usuario: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func login(_ sender: Any) {
        if let email = txtEmail.text, let clave = txtClave.text {
            Auth.auth().signIn(withEmail: email, password: clave) {
                (result, error) in
                if let result = result, error == nil {
                    let alertSuccess = UIAlertController(title: "Bienvenido(a)", message: "Inicio sesion correctamente", preferredStyle: .alert)
                    
                    UserDefaults.standard.set(email, forKey: self.usuario)
                    UserDefaults.standard.synchronize()
                    
                    alertSuccess.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: {_ in
                        self.entrarMenu()
                    }))
                    self.present(alertSuccess, animated: true, completion: nil)
                    self.txtEmail.text = ""
                    self.txtClave.text = ""
                    
                }
                else {
                    let alertError = UIAlertController(title: "Error", message: "Error al iniciar sesion", preferredStyle: .alert)
                    
                    alertError.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    self.present(alertError, animated: true, completion: nil)
                }
            }
        }
        
        
    }
    
    func entrarMenu() {
        let vc = self.storyboard?.instantiateViewController(identifier: "MenuViewController") as! MenuViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
 
    
}

