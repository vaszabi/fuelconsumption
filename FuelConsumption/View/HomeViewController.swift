//
//  ViewController.swift
//  FuelConsumption
//
//  Created by Szabolcs Varga on 2021. 06. 15..
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var detailedBtn: UIButton!
    @IBOutlet weak var simpleBtn: UIButton!
    
    private let buttonCornerRadius: CGFloat = 15
    private let buttonBorderWidth: CGFloat = 2
    private let buttonBorderColor: CGColor = UIColor.systemOrange.cgColor
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
        detailedBtn.layer.cornerRadius = buttonCornerRadius
        detailedBtn.layer.borderWidth = buttonBorderWidth
        detailedBtn.layer.borderColor = buttonBorderColor
        simpleBtn.layer.cornerRadius = buttonCornerRadius
        simpleBtn.layer.borderWidth = buttonBorderWidth
        simpleBtn.layer.borderColor = buttonBorderColor
    }

}

