//
//  FiltrelenmisUcuslarVC.swift
//  FlightManagement
//
//  Created by Asilcan Çetinkaya on 31.08.2022.
//

import UIKit

class FiltrelenmisUcuslarVC: UIViewController {
    
    var ucus : UcusModel?
    var ucusListesi = [UcusModel]()
    
    @IBOutlet weak var kategoriTxf: UILabel!
    @IBOutlet weak var filtreliTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filtreliTableView.delegate = self
        filtreliTableView.dataSource = self
        
        if case ucusListesi.first?.ucusTuru = 0 {
            kategoriTxf.text = "Planlanan Uçuşlar"
        }
        if case ucusListesi.first?.ucusTuru = 1 {
            kategoriTxf.text = "Rezerv Uçuşlar"
        }
        
        if case ucusListesi.first?.ucusTuru = 2 {
            kategoriTxf.text = "Airport Standby"
        }
        if case ucusListesi.first?.ucusTuru = 3 {
            kategoriTxf.text = "Home Standby"
        }
    }
    
}
extension FiltrelenmisUcuslarVC : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ucusListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let ucus = ucusListesi[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier:"ucusCell", for: indexPath) as! UcusTableViewCell
        cell.ucusTuruLabel.text = "\(ucus.ucusTuru)"
        cell.kabinMemuruLabel.text = ucus.kabinAmiri
        cell.varisLabel.text = ucus.gidilecekAlan
        if case var Int(ucus.ucusTuru!) = 0 {
            cell.ucusTuruLabel.text = "Planlanan Uçuş"
        }
        if case var Int(ucus.ucusTuru!) = 1 {
            cell.ucusTuruLabel.text = "Rezerv Uçuş"
        }
        if case var Int(ucus.ucusTuru!) = 2 {
            cell.ucusTuruLabel.text = "Airport Standby"
        }
        if case var Int(ucus.ucusTuru!) = 3 {
            cell.ucusTuruLabel.text = "Home Stanby"
        }
        return cell
    }
    
    
}
