//
//  ViewController.swift
//  FlightManagement
//
//  Created by Asilcan Çetinkaya on 31.08.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func girisYapButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "toAnasayfaVC", sender: nil)
    }
    
}

