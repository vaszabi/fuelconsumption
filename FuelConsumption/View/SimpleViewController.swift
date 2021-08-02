//
//  SimpleViewController.swift
//  FuelConsumption
//
//  Created by Szabolcs Varga on 2021. 06. 15..
//

import UIKit

class SimpleViewController: FCViewController {
    
    //MARK: Outlets
    @IBOutlet weak var traveledTextField: UITextField!
    @IBOutlet weak var refueledTextField: UITextField!
    @IBOutlet weak var calculateBtn: UIButton!
    @IBOutlet weak var calculatedLabel: UILabel!
    
    private var isTextFieldsNotEmpty: Bool {
        return traveledTextField.hasText && refueledTextField.hasText
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    @IBAction func calculateTapped(_ sender: Any) {
        guard isTextFieldsNotEmpty else {
            showEmptyFieldNotification()
            return
        }
        showConsumption()
    }
    
    //MARK: Private methods
    private func setupViews() {
        calculatedLabel.alpha = 0
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
        calculatedLabel.text = "Your vehicle consumed \(consumptionString) litres / 100 km on average."
        UIView.animate(withDuration: 1.0) {
            self.calculatedLabel.alpha = 1.0
        }
    }
}

//MARK: Textfield Delegates
extension SimpleViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        traveledTextField.resignFirstResponder()
        refueledTextField.resignFirstResponder()
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
