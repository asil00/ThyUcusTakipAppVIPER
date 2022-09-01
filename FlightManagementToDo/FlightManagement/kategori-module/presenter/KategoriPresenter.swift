//
//  KategoriPresenter.swift
//  FlightManagement
//
//  Created by Asilcan Çetinkaya on 31.08.2022.
//

import Foundation

class KategoriPresenter : ViewToPresenterKategoriProtocol {
    
    func VeriTabanınıGetir() {
        ucusKategoriInteractor?.butunVeriTabanınıGetir()
    }
    
    
    var ucusKategoriInteractor: PresenterToInteractorKategoriProtocol?
    
    var ucusKategoriView: presenterToViewKategoriProtocol?
    
    func filtrele(ucusTuru: Int) {
        ucusKategoriInteractor?.kategoriyeGoreFiltrele(ucusTuru: ucusTuru)
        
    }
    
}

extension KategoriPresenter : InteractorToPresenterKategoriProtocol {
    
    func presenteraVeriGonder(ucusBilgisi: Array<UcusModel>) {
        
        ucusKategoriView?.vieweVeriGonder(ucusBilgisi: ucusBilgisi)
    }
    
    
}
