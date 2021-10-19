//
//  FCButton.swift
//  FuelConsumption
//
//  Created by Szabolcs Varga on 2021. 10. 19..
//

import Foundation
import UIKit

class FCButton: UIButton {
    
    override func awakeFromNib() {
        self.setTitleColor(.black, for: .normal)
        self.backgroundColor = UIColor(named: "button")
    }
}
