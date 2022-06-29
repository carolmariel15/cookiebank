//
//  RegUsuViewController.swift
//  cookiebank
//
//  Created by Carol Mariel
//

import UIKit

class RegUsuViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    /*func registrarAuth () -> (String) {
        var mensajeAlert = ""
        
        if let email = txtEmail.text, let clave = txtClaveInternet.text {
            Auth.auth().createUser(withEmail: email, password: clave) {
                (result, error) in
                if let result = result, error == nil {
                    mensajeAlert = "Se registro correctamente"
                    
                    let alertSuccess = UIAlertController(title: "Bienvenido(a)", message: "Se registro correctamente", preferredStyle: .alert)
                    
                    alertSuccess.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    self.present(alertSuccess, animated: true, completion: nil)
                    self.txtEmail.text = ""
                    self.txtClaveInternet.text = ""
                    
                } else {
                    mensajeAlert = "Error al registrar cuenta (clave de internet 6 caracteres minimo)"
                    
                    let alertError = UIAlertController(title: "Error", message: "Error al registrar cuenta (contraseña 6 caracteres minimo)", preferredStyle: .alert)
                    
                    alertError.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    self.present(alertError, animated: true, completion: nil)
                }
            }
        }
        
        return mensajeAlert
    }*/
    
    
    

}
