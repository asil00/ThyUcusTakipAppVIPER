//
//  AnasayfaPresenter.swift
//  FlightManagement
//
//  Created by Asilcan Çetinkaya on 31.08.2022.
//

import Foundation

class AnasayfaPresenter : ViewToPresenterAnasayfaProtocol {
    
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol?
    
    var anasayfaView: PresenterToViewAnasayfaProtocol?
    
    func verileriGetir() {
        anasayfaInteractor?.dataBaseVeriGetir()
    }
    
    func ara(kelime: String) {
        anasayfaInteractor?.ucusAra(kelime: kelime)
    }
    
    func sil(ucusId: Int) {
        anasayfaInteractor?.ucusuSil(ucusId: ucusId)
    }
    
    func filtre(ucusTuru: Int) {
        anasayfaInteractor?.filtrele(ucusTuru: ucusTuru)
    }
    
    
}

extension AnasayfaPresenter : InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(UcusBilgisi: Array<UcusModel>) {
        anasayfaView?.vieweVeriGonder(UcusBilgisi:UcusBilgisi)
    }
    
    
}

