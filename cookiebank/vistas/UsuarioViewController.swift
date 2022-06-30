//
//  UsuarioViewController.swift
//  cookiebank
//
//  Created by Carol Mariel
//

import UIKit
import FirebaseFirestore

class UsuarioViewController: UIViewController {
    
    @IBOutlet weak var lblDni: UILabel!
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblApellido: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblCelular: UILabel!
    
    private let documentUsu: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.obtenerDatosUsuario()
    }
    
    func obtenerDatosUsuario() {
        if let documentUs = UserDefaults.standard.string(forKey: self.documentUsu) {
            Firestore.firestore().collection("usuario").document(documentUs).getDocument{
                (document, error) in
                if let document = document, document.exists {
                    self.lblDni.text = (document.data()!["dni"] as! String)
                    self.lblNombre.text = (document.data()!["nombres"] as! String)
                    self.lblApellido.text = (document.data()!["apellidos"] as! String)
                    self.lblEmail.text = (document.data()!["email"] as! String)
                    self.lblCelular.text = (document.data()!["celular"] as! String)
                    
                } else {
                    print("No se encontro al usuario")
                }
            }
        } else {
            print("El documentUsu es null")
        }
        
    }
    
    @IBAction func editar(_ sender: Any) {
    
        let alerta = UIAlertController (title: "Editar", message: "Actualizar datos", preferredStyle: .alert)
    
        let guardar = UIAlertAction(
            title: "Guardar", style: .default, handler: {
                (action: UIAlertAction) -> Void in
                let textField1 = alerta.textFields![0]
                let textField2 = alerta.textFields![1]
                let textField3 = alerta.textFields![2]
                self.editarDatosUsuario(nombre: textField1.text!, apellido: textField2.text!, celular: textField3.text!)
        })
    
        let cancelar = UIAlertAction(title: "Cancelar", style: .default) {(action: UIAlertAction) -> Void in}
        
        alerta.addTextField{(textField: UITextField) -> Void in
            textField.placeholder = "Nombres"
        }
        alerta.addTextField{(textField: UITextField) -> Void in
            textField.placeholder = "Apellidos"
        }
        alerta.addTextField{(textField: UITextField) -> Void in
            textField.placeholder = "Celular"
        }
        
        alerta.addAction(guardar)
        alerta.addAction(cancelar)
        
        present(alerta, animated: true, completion: nil)
    
    }

    func editarDatosUsuario(nombre: String, apellido: String, celular: String){
        let usuarioEdit = ["dni": lblDni.text!, "email": lblEmail.text!, "nombres": nombre, "apellidos": apellido, "celular": Int(celular)!] as [String: Any]
        
        Firestore.firestore().collection("usuario").document(self.documentUsu).setData(usuarioEdit) { err in
            if let err = err {
                let alert = UIAlertController(title: "Error", message: "No se pudo editar", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Aceptar", style: .default))
                
                self.present(alert, animated: true, completion: nil)
            } else {
                let alert = UIAlertController(title: "Editar", message: "Se actualizo los datos correctamente", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler:{_ in
                    self.obtenerDatosUsuario()
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
            
        
    }
    
}
