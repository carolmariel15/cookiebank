//
//  FavoritosViewController.swift
//  cookiebank
//
//  Created by piero on 6/30/22.
//

import UIKit
import FirebaseFirestore


class FavoritosViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
   
    

    @IBOutlet weak var TablaFavoritos: UITableView!
   
    var listaFavoritos = [Favorito]()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.listarFavoritos()
        TablaFavoritos.dataSource = self
        TablaFavoritos.delegate = self
      
        
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listaFavoritos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = TablaFavoritos.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let favorito = listaFavoritos[indexPath.row]
        celda.textLabel?.text = favorito.toString()
        return celda
    }

    func listarFavoritos(){
        
        let db = Firestore.firestore()
        db.collection("favoritos").getDocuments{
            (querySnapshot, err) in
            self.listaFavoritos.removeAll()
            if let err = err {
                print("Error al traer las Favoritos: \(err)")
            }else{
                for document in querySnapshot!.documents{
                    let favorito = Favorito(idfavorito: document.data()["idfavorito"] as! Int, nrocuenta: document.data()["nrocuenta"] as! String, descripcion: document.data()["descripcion"] as! String, fecha: document.data()["fecha"] as! String)
                    
                    self.listaFavoritos.append(favorito)
                    self.TablaFavoritos.reloadData()
                }
            }
        }
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          
         let destinationVc = segue.destination as! FavoritoFormViewController
          destinationVc.favoritoForm.idfavorito = listaFavoritos.count + 1
      }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let editar = UITableViewRowAction(style: .normal, title: "EDITAR"){
            (action,indexPath) in
            print("editando: " + String(self.listaFavoritos[indexPath.row].idfavorito))
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "FavoritoFormViewController") as! FavoritoFormViewController
            
            vc.favoritoForm = self.listaFavoritos[indexPath.row]
         
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        editar.backgroundColor = UIColor.blue
        
        let eliminar = UITableViewRowAction(style: .destructive, title: "ELIMINAR"){
            (action,indexPath) in
            print("eliminando: " + String(self.listaFavoritos[indexPath.row].idfavorito))
            let db = Firestore.firestore()
            let favoritoReference = db.collection("favoritos").document(String(self.listaFavoritos[indexPath.row].idfavorito)
            )
            favoritoReference.delete()
            self.listarFavoritos()
        }
        
        return [editar,eliminar]
    }
    
  
    

}
