//
//  UsuTarjetaViewController.swift
//  cookiebank
//
//  Created by Carol Mariel
//

import UIKit

class UsuTarjetaViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    @IBAction func validarTarjeta(_ sender: Any) {
        self.mandarRegistro()
    }
    
    func mandarRegistro() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RegUsuViewController") as! RegUsuViewController
        vc.existe = "Ok"
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    

    

}
