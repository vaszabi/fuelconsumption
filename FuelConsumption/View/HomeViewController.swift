//
//  ViewController.swift
//  FuelConsumption
//
//  Created by Szabolcs Varga on 2021. 06. 15..
//

import UIKit

class HomeViewController: FCViewController {
    
    //MARK: Outlets
    @IBOutlet weak var detailedBtn: FCButton!
    @IBOutlet weak var simpleBtn: FCButton!
    
    private var router: Router?
    

    //MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
        router = Router()
        router?.viewController = self
    }
    
    //MARK: IBActions
    @IBAction func detailedTapped(_ sender: Any) {
        router?.openDetailedView()
    }
    
    @IBAction func simpleTapped(_ sender: Any) {
        router?.openSimpleView()
    }
    
    //MARK: Private methods
    private func setupButtons() {
        detailedBtn.layer.cornerRadius = Constants.buttonCornerRadius
        detailedBtn.layer.borderWidth = Constants.buttonBorderWidth
        detailedBtn.layer.borderColor = Constants.buttonBorderColor
        simpleBtn.layer.cornerRadius = Constants.buttonCornerRadius
        simpleBtn.layer.borderWidth = Constants.buttonBorderWidth
        simpleBtn.layer.borderColor = Constants.buttonBorderColor
    }

}

