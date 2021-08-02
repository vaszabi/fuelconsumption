//
//  SimplePresenter.swift
//  FuelConsumption
//
//  Created by Szabolcs Varga on 2021. 06. 17..
//

import UIKit

//TODO: Implement Presenters
protocol FuelPresenterProtocol {
    
    func calculateTapped()
    
}

class SimplePresenter: FuelPresenterProtocol {
    
    weak var view: SimpleViewController?
    
    func calculateTapped() {
        
    }
    
}
