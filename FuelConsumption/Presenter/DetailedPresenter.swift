//
//  DetailedPresenter.swift
//  FuelConsumption
//
//  Created by Szabolcs Varga on 2021. 06. 17..
//

import UIKit

class DetailedPresenter: FuelPresenterProtocol {
    
    weak var delegate: DetailedViewController?
    
    func calculateTapped() {
        guard let view = delegate else { return }
        guard let distanceText = view.distanceTextField.text,
              let distance = Double(distanceText),
              let fuelText = view.fuelTextField.text,
              let fuelCons = Double(fuelText.replacingOccurrences(of: ",", with: ".")),
              let fuelPriceText = view.priceTextField.text,
              let fuelPrice = Double(fuelPriceText),
              let personsText = view.personsTextField.text,
              let persons = Int(personsText),
              let etcText = view.etcTextField.text,
              let etcPrice = Double(etcText) else { return }
        
        let totalPrice = ((distance/100) * fuelCons * fuelPrice) + etcPrice
        let singlePrice = Int(totalPrice) / persons
        
        view.showResult(with: (totalPrice, singlePrice))
    }
    
}
