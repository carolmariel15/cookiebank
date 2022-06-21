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
    @IBOutlet weak var btnRegistrar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func login(_ sender: Any) {
    }
    
    @IBAction func registrar(_ sender: Any) {
        if let email = txtEmail.text, let clave = txtClave.text {
            Auth.auth().createUser(withEmail: email, password: clave) {
                (result, error) in
                if let result = result, error == nil {
                    let alertSuccess = UIAlertController(title: "Bienvenido(a)", message: "Se registro correctamente", preferredStyle: .alert)
                    
                    alertSuccess.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    self.present(alertSuccess, animated: true, completion: nil)
                    self.txtEmail.text = ""
                    self.txtClave.text = ""
                    
                } else {
                    let alertError = UIAlertController(title: "Error", message: "Error al registrar cuenta (contraseña 6 caracteres minimo)", preferredStyle: .alert)
                    
                    alertError.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    self.present(alertError, animated: true, completion: nil)
                }
            }
        }
        
        
    }
    
}

