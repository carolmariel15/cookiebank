//
//  UsuTarjetaViewController.swift
//  cookiebank
//
//  Created by Carol Mariel
//

import UIKit
import FirebaseFirestore

class UsuTarjetaViewController: UIViewController {
    
    
    @IBOutlet weak var txtFchVencimiento: UITextField!
    @IBOutlet weak var txtCvc: UITextField!
    @IBOutlet weak var txtClave: UITextField!
    @IBOutlet weak var txtTarjeta: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func validarTarjeta(_ sender: Any) {
        let db = Firestore.firestore()

        db.collection("tarjeta").document(txtTarjeta.text!).getDocument{
            (document, error) in
            if let document = document, document.exists{

                print(document.documentID)
                
                let tarjeta = Tarjeta(idTarjeta: document.documentID, tipo: document.data()!["tipo"] as! String, clave: document.data()!["clave"] as! Int, fchVencimiento: document.data()!["fchVencimiento"] as! String, fchRegistro: document.data()!["fchRegistro"] as! String, cvc: document.data()!["cvc"] as! Int,dni: document.data()!["dni"] as! String)

                self.validaTarjetaExistente(tarjeta: tarjeta)
            } else {
                let alert = UIAlertController(title: "Error", message: "La tarjeta no existe", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Aceptar", style: .destructive))
            }
        }

    }
    
    func validaTarjetaExistente(tarjeta: Tarjeta) {
        if(tarjeta.fchVencimiento == txtFchVencimiento.text! && tarjeta.cvc == Int(txtCvc.text!)! && tarjeta.clave == Int(txtClave.text!)!) {
            
            self.mandarRegistro()
            
        } else {
            let alert = UIAlertController(title: "Error", message: "Ingrese correctamente los datos de la tarjeta", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Aceptar", style: .destructive))
        }
    }
    
    func mandarRegistro(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RegUsuViewController") as! RegUsuViewController
        vc.existe = "Ok"
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    

    

}
