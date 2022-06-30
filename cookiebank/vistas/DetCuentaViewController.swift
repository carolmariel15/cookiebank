//
//  DetCuentaViewController.swift
//  cookiebank
//
//  Created by Carol Mariel on 29/06/22.
//

import UIKit

class DetCuentaViewController: UIViewController {
    
    @IBOutlet weak var txtTipocuenta: UILabel!
    @IBOutlet weak var txtIdCuenta: UILabel!
    @IBOutlet weak var txtSaldo: UILabel!
    
    var cuenta: Cuenta = Cuenta(idCuenta: 0, tipo: "", idTarjeta: 0, dni: "", saldo: 0.0)
    
    var dni: String = ""
    var idTarjeta: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dni = cuenta.dni
        self.idTarjeta = cuenta.idTarjeta
        txtTipocuenta.text = String(cuenta.tipo)
        txtIdCuenta.text = String(cuenta.idCuenta)
        txtSaldo.text = String(cuenta.saldo)
    }
    

}
