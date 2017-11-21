//
//  DetailViewController.swift
//  Bola
//
//  Created by SMK IDN MI on 11/21/17.
//  Copyright © 2017 Djoendhie. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var labelNama: UILabel!
    @IBOutlet weak var labelTl: UILabel!
    @IBOutlet weak var labelUmur: UILabel!
    @IBOutlet weak var labelPosisi: UILabel!
    @IBOutlet weak var labelClub: UILabel!
    @IBOutlet weak var labelNegara: UILabel!
    
    var passnama:String?
    var passtl:String?
    var passumur:String?
    var passposisi:String?
    var passclub:String?
    var passnegara:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelNama.text = passnama
        labelTl.text = passtl
        labelUmur.text = passumur
        labelClub.text = passclub
        labelPosisi.text = passposisi
        labelNegara.text = passnegara

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
