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
    
    var listaTarjetas = [Tarjeta]()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.listarPeliculas()
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
    
    func listarPeliculas(){
        let db = Firestore.firestore()
        db.collection("tarjeta").getDocuments{
            (querySnapshot, err) in
            self.listaTarjetas.removeAll()
            if let err = err {
                print("Error al traer las tarjetas: \(err)")
            }else{
                for document in querySnapshot!.documents{
                    let tarjeta = Tarjeta(idTarjeta: document.documentID  , tipo: document.data()["tipo"] as! String, clave: document.data()["clave"] as! Int, fchVencimiento: document.data()["fchVencimiento"] as! String, fchRegistro: document.data()["fchRegistro"] as! String, cvc: document.data()["cvc"] as! Int)
                    
                    self.listaTarjetas.append(tarjeta)
                    self.tablaTarjetas.reloadData()
                }
            }
        }
    }

   
}
