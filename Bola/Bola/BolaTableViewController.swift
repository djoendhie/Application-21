//
//  BolaTableViewController.swift
//  Bola
//
//  Created by SMK IDN MI on 11/21/17.
//  Copyright © 2017 Djoendhie. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class BolaTableViewController: UITableViewController {
    
    var namaSelected:String?
    var tlSelected:String?
    var umurSelected:String?
    var posisiSelected:String?
    var clubSelected:String?
    var negaraSelected:String?
    
    var nampungId : String? = nil
    var arraysiswa = [[String:String]]()

    override func viewDidLoad() {
        super.viewDidLoad()
//        print("id + " + nampungId!)
        let params = ["id_nama" : nampungId]
        let url = "http://localhost/Bola/index.php/api/getbola"
        
        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler:
            { (response) in
                
                
                if response.result.isSuccess {
                    //kalau response suces kita ambil json
                    let json = JSON(response.result.value as Any)
                    print(json)
                    //get jsonaray dari json arrayq
                    self.arraysiswa = json["data"].arrayObject as! [[String : String]]
                    //check d log
                    //check jumlah array
                    if (self.arraysiswa.count > 0){
                        
                        //refresh tableview
                        self.tableView.reloadData()
                    }
                }
                else{
                    
                    print("error server")
                    
                }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arraysiswa.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellBola", for: indexPath) as! BolaTableViewCell
        
        var serverid = arraysiswa[indexPath.row]
        
        var id = serverid["id_nama"]
        let nama = serverid["nama"]
//        let tl = serverid["tl"]
//        let umur = serverid["umur"]
//        let posisi = serverid["posisi"]
//        let club = serverid["club"]
//        let negara = serverid["negara"]
//        //print judul
        
        cell.labelNama.text = nama
//        cell.labelTl.text = tl
//        cell.labelUmur.text = umur
//        cell.labelPosisi.text = posisi
//        cell.labelClub.text = club
//        cell.labelNegara.text = negara
        
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Row \(indexPath.row)selected")
        
        let task = arraysiswa[indexPath.row]
        namaSelected = task["id_nama"] as! String
        tlSelected = task["tl"] as! String
        umurSelected = task["umur"] as! String
        posisiSelected = task["posisi"] as! String
        clubSelected = task["club"] as! String
        negaraSelected = task["negara"] as! String
        
         performSegue(withIdentifier: "passIsi", sender: self)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "passIsi" {
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! DetailViewController
                let value = arraysiswa[indexPath.row]
                
                controller.passnama = value["nama"] as! String
                controller.passtl = value["tl"] as! String
                controller.passumur = value["umur"] as! String
                controller.passposisi = value["posisi"] as! String
                controller.passclub = value["club"] as! String
                controller.passnegara = value["negara"] as! String
                
                
            }
        }
    }
}





