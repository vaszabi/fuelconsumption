//
//  SimplePresenter.swift
//  FuelConsumption
//
//  Created by Szabolcs Varga on 2021. 06. 17..
//

import UIKit

protocol FuelPresenterProtocol {
    
    func calculateTapped()
    
}

class SimplePresenter: FuelPresenterProtocol {
    
    weak var delegate: SimpleViewController?
    
    func calculateTapped() {
        guard let view = delegate,
              let distance = view.traveledTextField.text,
              let litres = view.refueledTextField.text else {return}
        let consumption = ((litres as NSString).floatValue / (distance as NSString).floatValue) * 100
        let consumptionString = String(format: "%.2f", consumption)
        view.showResult(with: consumptionString)
    }
    
}
