//

//

import UIKit

class TarjetaFormViewController: UIViewController {

    
    @IBOutlet weak var txtIdTarjeta: UITextField!
    @IBOutlet weak var txtmmaa: UITextField!
    @IBOutlet weak var txtcvc: UITextField!
    @IBOutlet weak var txtClave: UITextField!
    @IBOutlet weak var txtDni: UITextField!
    @IBOutlet weak var txtFechaReg: UITextField!
    @IBOutlet weak var txtTipo: UITextField!
    
    var tarjetaForm: Tarjeta = Tarjeta(idTarjeta: "", tipo: "", clave: 0, fchVencimiento: "", fchRegistro: "", cvc: 0, dni: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("INGRESANDO A FORMULARIO DE PELICULAS")
       
        print(tarjetaForm.idTarjeta)
        txtIdTarjeta.text = String(tarjetaForm.idTarjeta)
        txtmmaa.text = String(tarjetaForm.fchVencimiento)
        txtcvc.text = String(tarjetaForm.cvc)
        txtClave.text = String(tarjetaForm.clave)
        txtDni.text = String(tarjetaForm.dni)
        txtFechaReg.text = String(tarjetaForm.fchRegistro)
        txtTipo.text = String(tarjetaForm.tipo)
    }
    

   

}
