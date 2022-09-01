//
//  KategoriProtcols.swift
//  FlightManagement
//
//  Created by Asilcan Çetinkaya on 31.08.2022.
//

import Foundation

protocol ViewToPresenterKategoriProtocol {
    
    var ucusKategoriInteractor : PresenterToInteractorKategoriProtocol? {get set}
    
    var ucusKategoriView : presenterToViewKategoriProtocol? {get set}
    
    func VeriTabanınıGetir()
    func filtrele(ucusTuru:Int)
    
}
protocol PresenterToInteractorKategoriProtocol {
    
    var kategoriPresenter :InteractorToPresenterKategoriProtocol? {get set}
    
    func kategoriyeGoreFiltrele(ucusTuru:Int)
    func butunVeriTabanınıGetir()
    
}
protocol InteractorToPresenterKategoriProtocol {
    
    func presenteraVeriGonder(ucusBilgisi:Array<UcusModel>)
    
}
protocol presenterToViewKategoriProtocol {
    
    func vieweVeriGonder(ucusBilgisi:Array<UcusModel>)
    
}
protocol PresenterToRouterKategoriProtocol {
    
    static func createModule(ref: KategoriVC)
    
}

