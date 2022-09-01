//
//  ucusEkleVC.swift
//  FlightManagement
//
//  Created by Asilcan Çetinkaya on 31.08.2022.
//

import UIKit

class ucusEkleVC: UIViewController {
    
    
    var ucusEklePresenterNesnesi : ViewToPresenterUcusEkleProtocol?
    
    var datePicker: UIDatePicker?

    @IBOutlet weak var kalkisTF: UITextField!
    @IBOutlet weak var varisTF: UITextField!
    @IBOutlet weak var kabinAmiriTF: UITextField!
   
    @IBOutlet weak var ucusTarihiTF: UITextField!
    @IBOutlet weak var ucusTuruSegmented: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        datePicker = UIDatePicker()
                datePicker?.datePickerMode = .date
        ucusTarihiTF.inputView = datePicker
                
        UcusEkleRouter.createModule(ref: self)
                if #available(iOS 13.4, *) {
                    datePicker?.preferredDatePickerStyle = .wheels
                    
                    

                }
        let dokunmaAlgilama = UITapGestureRecognizer(target: self, action: #selector(dokunmaAlgilamaMetod))
                view.addGestureRecognizer(dokunmaAlgilama)

                datePicker?.addTarget(self, action: #selector(tarihGoster(uiDatePicker:)), for: .valueChanged)
       
    }
    @IBAction func ucusSegmentedControl(_ sender: UISegmentedControl) {
        let secilenIndeks = sender.selectedSegmentIndex
                let secilenBaslik = sender.titleForSegment(at: secilenIndeks)!
    }
    
    @objc func tarihGoster(uiDatePicker: UIDatePicker) {
            let tarihFormat = DateFormatter()
            tarihFormat.dateFormat = "dd/MM/yyyy"
            let alinanTarih = tarihFormat.string(from: uiDatePicker.date)
            ucusTarihiTF.text = alinanTarih
        
    }
    
    @objc func dokunmaAlgilamaMetod() {
            view.endEditing(true)
        
    }

    @IBAction func ucusEkleButtonClicked(_ sender: Any) {
        
        if let katf = kabinAmiriTF.text, let vatf = varisTF.text, let utt = ucusTarihiTF.text, let uct = ucusTuruSegmented?.selectedSegmentIndex {
            ucusEklePresenterNesnesi?.ekle(ucusTuru: uct, kabinAmiri: katf, gidilecekAlan: vatf, ucusTarihi: utt)
            
            self.navigationController?.popToRootViewController(animated: true)
           
    }
    
}
}
