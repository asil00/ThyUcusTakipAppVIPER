//
//  KategoriVC.swift
//  FlightManagement
//
//  Created by Asilcan Çetinkaya on 31.08.2022.
//

import UIKit

class KategoriVC: UIViewController {
    
    var kategoriPresenterNesnesi : ViewToPresenterKategoriProtocol?
    var ucusListesi = [UcusModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        

        veritabaniKopyalama()
        KategoriRouter.createModule(ref: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        kategoriPresenterNesnesi?.VeriTabanınıGetir()
        print(ucusListesi.count)
        
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toUcusKategoriVC" {
            let destinationVC = segue.destination as! FiltrelenmisUcuslarVC
            destinationVC.ucusListesi = ucusListesi
            
        }
        
        
    }
    
    @IBAction func planlananBuon(_ sender: Any) {
        kategoriPresenterNesnesi?.filtrele(ucusTuru: 0)
        performSegue(withIdentifier: "toUcusKategoriVC", sender: ucusListesi)
        
        
    }
    
    @IBAction func rezervButon(_ sender: Any) {
        kategoriPresenterNesnesi?.filtrele(ucusTuru: 1)
        performSegue(withIdentifier: "toUcusKategoriVC", sender: ucusListesi)
    }
    
    @IBAction func airportButon(_ sender: Any) {
        kategoriPresenterNesnesi?.filtrele(ucusTuru: 2)
        performSegue(withIdentifier: "toUcusKategoriVC", sender: ucusListesi)
    }
    
    @IBAction func homeButon(_ sender: Any) {
        kategoriPresenterNesnesi?.filtrele(ucusTuru: 3)
        performSegue(withIdentifier: "toUcusKategoriVC", sender: ucusListesi)
    }
    
}
extension KategoriVC : presenterToViewKategoriProtocol {
    
    func vieweVeriGonder(ucusBilgisi: Array<UcusModel>) {
        self.ucusListesi = ucusBilgisi
        
    }
    
}
