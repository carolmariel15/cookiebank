//
//  FavoritoFormViewController.swift
//  cookiebank
//
//  Created by piero on 6/30/22.
//

import UIKit

import FirebaseFirestore

class FavoritoFormViewController: UIViewController {
    
    
    @IBOutlet weak var txtIdFavorito: UITextField!
    
    @IBOutlet weak var txtCuenta: UITextField!
    
    @IBOutlet weak var txtFecha: UITextField!
    @IBOutlet weak var txtDescripcion: UITextField!
    
    
    var favoritoForm: Favorito = Favorito(idfavorito: 0, nrocuenta: "", descripcion: "", fecha: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        print("INGRESANDO A FORMULARIO")
        print(favoritoForm.idfavorito)
        
        txtIdFavorito.text = String(favoritoForm.idfavorito)
        txtCuenta.text = String(favoritoForm.nrocuenta)
        txtDescripcion.text = String(favoritoForm.descripcion)
        txtFecha.text = String(favoritoForm.fecha)
      
        
       
    }
    
    
    @IBAction func Registrar(_ sender: Any) {
        
        let favoritoToSave = ["idfavorito": Int(txtIdFavorito.text!)!,
                              "nrocuenta": txtCuenta.text!, "descripcion": txtDescripcion.text!,"fecha": txtFecha.text!
        ]as[String:Any ]
            
        let db = Firestore.firestore()
        
    
          
           
           
        
        
        if (favoritoForm.idfavorito > 0) {
            
            print("Guardando Nueva favorito...")
           
            db.collection("favoritos").document(String(favoritoForm.idfavorito)).setData(favoritoToSave)
        }else {
            
            print("Editando Favorito...")
            db.collection("favoritos").addDocument(data: favoritoToSave)
            
        }
        
        
        
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FavoritosViewController") as! FavoritosViewController
        self.navigationController?.pushViewController(vc, animated: true)
            
        
    }
        
        
    }
    


