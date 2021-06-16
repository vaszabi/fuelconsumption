//
//  SimpleViewController.swift
//  FuelConsumption
//
//  Created by Szabolcs Varga on 2021. 06. 15..
//

import UIKit

class SimpleViewController: UIViewController {
    
    @IBOutlet weak var traveledTextField: UITextField!
    @IBOutlet weak var refueledTextField: UITextField!
    @IBOutlet weak var calculateBtn: UIButton!
    @IBOutlet weak var calculatedLabel: UILabel!
    
    private var isTextfieldsEmpty: Bool {
        return traveledTextField.hasText && refueledTextField.hasText
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    @IBAction func calculateTapped(_ sender: Any) {
        guard isTextfieldsEmpty else {
            showEmptyFieldNotification()
            return
        }
        showConsumption()
    }
    
    private func setupViews() {
        calculatedLabel.isHidden = true
        traveledTextField.delegate = self
        refueledTextField.delegate = self
        calculateBtn.layer.cornerRadius = Constants.buttonCornerRadius
        calculateBtn.layer.borderWidth = Constants.calculateBorderWidth
        calculateBtn.layer.borderColor = Constants.buttonBorderColor
    }
    
    private func showConsumption() {
        guard let distance = traveledTextField.text,
              let litres = refueledTextField.text else {return}
        let consumption = ((litres as NSString).floatValue / (distance as NSString).floatValue) * 100
        let consumptionString = String(format: "%.2f", consumption)
        calculatedLabel.text = "Your vehicle consumed \(consumptionString) litres."
        calculatedLabel.isHidden = false
        
    }
    
    private func showEmptyFieldNotification() {
        let alert = UIAlertController(title: "Empty fields", message: "Please input data into all fields.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
}

extension SimpleViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
              let rangeOfTextToReplace = Range(range, in: textFieldText) else {
            return false
        }
        var maxCount = 4
        if textField == refueledTextField {
            maxCount = 3
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= maxCount
    }
    
}
