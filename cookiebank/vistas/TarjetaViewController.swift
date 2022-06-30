//
//  TarjetaViewController.swift
//  cookiebank
//
//  Created by Carol Mariel
//

import UIKit

import FirebaseFirestore

class TarjetaViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    @IBOutlet weak var tablaTarjetas: UITableView!
    
    var listaTarjetas = [Tarjetas]()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.listarTarjetas()
        tablaTarjetas.dataSource = self
        tablaTarjetas.delegate = self
      
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listaTarjetas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tablaTarjetas.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let tarjeta = listaTarjetas[indexPath.row]
        celda.textLabel?.text = tarjeta.toString()
        return celda
    }
    
    func listarTarjetas(){
        
        let db = Firestore.firestore()
        db.collection("tarjetas").getDocuments{
            (querySnapshot, err) in
            self.listaTarjetas.removeAll()
            if let err = err {
                print("Error al traer las Tarjetas: \(err)")
            }else{
                for document in querySnapshot!.documents{
                    let tarjeta = Tarjetas(idtarjetas: document.data()["idtarjetas"] as! Int, tipo: document.data()["tipo"] as! String, clave: document.data()["clave"] as! Int, fchVencimiento: document.data()["fchVencimiento"] as! String, fchRegistro: document.data()["fchRegistro"] as! String, cvc: document.data()["cvc"] as! Int, dni: document.data()["dni"] as! String)
                    
                    self.listaTarjetas.append(tarjeta)
                    self.tablaTarjetas.reloadData()
                }
            }
        }
    
    }
    
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
       let destinationVc = segue.destination as! TarjetaFormViewController
        destinationVc.tarjetaForm.idtarjetas = listaTarjetas.count + 1
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let editar = UITableViewRowAction(style: .normal, title: "EDITAR"){
            (action,indexPath) in
            print("editando: " + String(self.listaTarjetas[indexPath.row].idtarjetas))
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "TarjetaFormViewController") as! TarjetaFormViewController
            
            vc.tarjetaForm = self.listaTarjetas[indexPath.row]
         
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        editar.backgroundColor = UIColor.blue
        
        let eliminar = UITableViewRowAction(style: .destructive, title: "ELIMINAR"){
            (action,indexPath) in
            print("eliminando: " + String(self.listaTarjetas[indexPath.row].idtarjetas))
            let db = Firestore.firestore()
            let peliculaReference = db.collection("tarjetas").document(String(self.listaTarjetas[indexPath.row].idtarjetas)
            )
            peliculaReference.delete()
            self.listarTarjetas()
        }
        
        return [editar,eliminar]
    }
    
    
    
  
    
}
