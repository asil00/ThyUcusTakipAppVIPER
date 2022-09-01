//
//  AnasayfaVC.swift
//  FlightManagement
//
//  Created by Asilcan Çetinkaya on 31.08.2022.
//

import UIKit

class AnasayfaVC: UIViewController {
    
    
    @IBOutlet weak var sonUcuslarTableView: UITableView!
    
    var anaSayfaPresenterNesnesi : ViewToPresenterAnasayfaProtocol?
    var ucusListesi = [UcusModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        sonUcuslarTableView.delegate = self
        sonUcuslarTableView.dataSource = self
        AnasayfaRouter.createModule(ref: self)
        veritabaniKopyalama()
        
        sonUcuslarTableView.backgroundColor = UIColor.clear

    }
    
    func veritabaniKopyalama(){
        
        let bundleYolu = Bundle.main.path(forResource: "UcusBilgi", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("UcusBilgi.sqlite")
        let fm = FileManager.default
        if fm.fileExists(atPath: kopyalanacakYer.path){
            print("Veritabanı zaten var")
        }else{
            do{
                try fm.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        anaSayfaPresenterNesnesi?.verileriGetir()
        
    }
    @IBAction func ucusKategoriButon(_ sender: Any) {
        
        performSegue(withIdentifier: "toKategoriVC", sender: nil)
    }
    
    @IBAction func yeniEkleButtonClicked(_ sender: Any) {
        
        performSegue(withIdentifier: "toYeniEkle", sender: nil)
    }
    
}

extension AnasayfaVC : PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(UcusBilgisi: Array<UcusModel>) {
        self.ucusListesi = UcusBilgisi
        self.sonUcuslarTableView.reloadData()
    }
    
}

extension AnasayfaVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ucusListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ucus = ucusListesi.reversed()[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ucusCell", for: indexPath) as! UcusTableViewCell
        cell.contentView.backgroundColor = UIColor.clear

        cell.varisLabel.text = ucus.gidilecekAlan
        cell.tarihLabel.text = ucus.ucusTarihi
        cell.kabinMemuruLabel.text = ucus.kabinAmiri
        
     //   cell.ucusTuruLabel.text = "\(ucus.ucusTuru!)"
        
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
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Sil"){ [self] (contextualAction,view,bool) in
            let ucus = ucusListesi.reversed()[indexPath.row]
            
            let alert = UIAlertController(title: "Sil", message: "\(ucus.gidilecekAlan!) planlı uçuş silinecek?", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(cancelAction)
            
            let yesAction = UIAlertAction(title: "Evet", style: .destructive){ action in
                self.anaSayfaPresenterNesnesi?.sil(ucusId: ucus.ucusId!)
            }
            alert.addAction(yesAction)
            
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

