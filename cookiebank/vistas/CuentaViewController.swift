//
//  CuentaViewController.swift
//  cookiebank
//
//  Created by Carol Mariel
//

import UIKit
import FirebaseFirestore

class CuentaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tabla: UITableView!
    
    var lista = [Cuenta]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.obtenerCuentas()
        tabla.dataSource = self
        tabla.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        lista.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabla.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cuenta = lista[indexPath.row]
        cell.textLabel?.text = cuenta.toString()
        return cell
    }
    
    func obtenerCuentas() {
        if let dniUsu = UserDefaults.standard.string(forKey: "dni") {
    
            Firestore.firestore().collection("cuenta").whereField("dni", isEqualTo: dniUsu).getDocuments() { (querySnapshot, err) in
        
            self.lista.removeAll()
            
            if let err = err {
                print("Error al traer las cuentas: \(err)")
                
            } else {
                for document in
                    querySnapshot!.documents{
                    let cuenta = Cuenta(idCuenta: document.documentID, tipo: document.data()["tipo"] as! String, idTarjeta: document.data()["idTarjeta"] as! String, dni: document.data()["dni"] as! String, saldo: document.data()["saldo"] as! Double)
                    
                    self.lista.append(cuenta)
                    self.tabla.reloadData()
                }
            }}
        }
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let ver = UITableViewRowAction(style: .normal, title: "Ver") {
            (action, indexPath) in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetCuentaViewController") as! DetCuentaViewController
            
            vc.cuenta = self.lista[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
        ver.backgroundColor = UIColor.lightGray
        
        let eliminar = UITableViewRowAction(style: .destructive, title: "Eliminar") {
            (action, indexPath) in
            let cuentaReference = Firestore.firestore().collection("cuenta")
                .document(String(self.lista[indexPath.row].idCuenta))
            cuentaReference.delete()
            self.obtenerCuentas()
        }
        
        return [ver, eliminar]
    }

}
