//

//

import UIKit
import FirebaseFirestore
class TarjetaFormViewController: UIViewController {

    
    @IBOutlet weak var txtIdTarjeta: UITextField!
    @IBOutlet weak var txtMMAA: UITextField!
    @IBOutlet weak var txtCVC: UITextField!
    @IBOutlet weak var txtClave: UITextField!
    @IBOutlet weak var txtDni: UITextField!
    @IBOutlet weak var txtFechereg: UITextField!
    @IBOutlet weak var txtTipo: UITextField!
    
    
    var tarjetaForm: Tarjetas = Tarjetas(idtarjetas: 0, tipo: "", clave: 0, fchVencimiento: "", fchRegistro: "", cvc: 0, dni: "")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("INGRESANDO A FORMULARIO")
        print(tarjetaForm.idtarjetas)
        
        txtIdTarjeta.text = String(tarjetaForm.idtarjetas)
        txtMMAA.text = String(tarjetaForm.fchVencimiento)
        txtCVC.text = String(tarjetaForm.cvc)
        txtClave.text = String(tarjetaForm.clave)
        txtDni.text = String(tarjetaForm.dni)
        txtFechereg.text = String(tarjetaForm.fchRegistro)
        txtTipo.text = String(tarjetaForm.tipo)
        
       
    }
    
    @IBAction func Registrar(_ sender: Any) {
        
        let tarjetaToSave = ["idtarjetas": Int(txtIdTarjeta.text!)!,
                              "fchVencimiento": txtMMAA.text!, "cvc": Int(txtCVC.text!)! , "clave": Int(txtClave.text!)! ,"dni": txtDni.text!,"fchRegistro": txtFechereg.text!,"tipo": txtTipo.text!
        ]as[String:Any ]
            
        let db = Firestore.firestore()
        
    
          
           
           
        
        
        if (tarjetaForm.idtarjetas > 0) {
            
            print("Guardando Nueva tarjeta...")
           
            db.collection("tarjetas").document(String(tarjetaForm.idtarjetas)).setData(tarjetaToSave)
        }else {
            
            print("Editando tarjeta...")
            db.collection("tarjetas").addDocument(data: tarjetaToSave)
            
        }
        
        
        
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TarjetaViewController") as! TarjetaViewController
        self.navigationController?.pushViewController(vc, animated: true)
            
        
    }
   
        
    
        
    }
    
   



