//
//  RegUsuViewController.swift
//  cookiebank
//
//  Created by Carol Mariel
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class RegUsuViewController: UIViewController {

    @IBOutlet weak var txtDni: UITextField!
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtApellido: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtCelular: UITextField!
    @IBOutlet weak var txtClaveInternet: UITextField!
    
    var existe: String = "No"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func registrar(_ sender: Any) {
        let usuarioSave = ["dni": txtDni.text!, "email": txtEmail.text!, "nombres": txtNombre.text!, "apellidos": txtApellido.text!, "celular": Int(txtCelular.text!)!] as [String: Any]
        
        let db = Firestore.firestore()
        
        if (existe == "Ok") {
            db.collection("usuario").addDocument(data: usuarioSave) {err in
                if let err = err {
                    print("Error al registrar")
                } else {
                    self.registrarAuth()
                    print("Se registro correctamente")
                }
            }
        } else {
            print("La tarjeta ingresada no es valida")
        }
        
        
    }
    
    func registrarAuth () -> (String) {
        var mensajeAlert = ""
        
        if let email = txtEmail.text, let clave = txtClaveInternet.text {
            Auth.auth().createUser(withEmail: email, password: clave) {
                (result, error) in
                if let result = result, error == nil {
                    mensajeAlert = "Se registro correctamente"
                    
                    let alertSuccess = UIAlertController(title: "Bienvenido(a)", message: "Se registro correctamente", preferredStyle: .alert)
                    
                    alertSuccess.addAction(UIAlertAction(title: "Aceptar", style: .default, handler:{_ in
                        self.volverLogin()
                    }))
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
    }
    
    
    func volverLogin(){
        let vc = self.storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
