//
//  FCViewController.swift
//  FuelConsumption
//
//  Created by Szabolcs Varga on 2021. 08. 02..
//

import UIKit

class FCViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(named: "background")
    }
    
     func showEmptyFieldNotification() {
        let alert = UIAlertController(title: "Empty fields", message: "Please input data into all fields.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }

}
