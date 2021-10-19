//
//  DetailedViewController.swift
//  FuelConsumption
//
//  Created by Szabolcs Varga on 2021. 06. 15..
//

import UIKit

class DetailedViewController: FCViewController {
    
    //MARK: Outlets
    @IBOutlet weak var distanceTextField: UITextField!
    @IBOutlet weak var fuelTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var personsTextField: UITextField!
    @IBOutlet weak var calculateBtn: FCButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var etcTextField: UITextField!
    @IBOutlet weak var etcLabel: UILabel!
    
    private var isTextFieldsNotEmpty: Bool {
        return distanceTextField.hasText && fuelTextField.hasText &&
            priceTextField.hasText && personsTextField.hasText && etcTextField.hasText
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    @IBAction func calculateTapped(_ sender: Any) {
        guard isInputCorrect() else {
            return
        }
        handleCorrectInputs()
    }
    
    //MARK: Private methods
    private func setupViews() {
        personsTextField.text = "1"
        calculateBtn.layer.cornerRadius = Constants.buttonCornerRadius
        calculateBtn.layer.borderWidth = Constants.calculateBorderWidth
        calculateBtn.layer.borderColor = Constants.buttonBorderColor
        resultLabel.alpha = 0
    }
    
    private func handleCorrectInputs() {
        guard let distanceText = distanceTextField.text,
              let distance = Double(distanceText),
              let fuelText = fuelTextField.text,
              let fuelCons = Double(fuelText),
              let fuelPriceText = priceTextField.text,
              let fuelPrice = Double(fuelPriceText),
              let personsText = personsTextField.text,
              let persons = Int(personsText),
              let etcText = etcTextField.text,
              let etcPrice = Double(etcText) else { return }
        
        let totalPrice = ((distance/100) * fuelCons * fuelPrice) + etcPrice
        let singlePrice = Int(totalPrice) / persons
        showResult(with: (totalPrice, singlePrice))
    }
    
    private func showResult(with result:(total:Double, single:Int) ) {
        
        resultLabel.text = "Your trip's total cost is: \(Int(result.total)) HUF. \n\(result.single) HUF per persons."
        resultLabel.isHidden = false
        UIView.animate(withDuration: 1) {
            self.resultLabel.alpha = 1.0
        }
    }
    
    private func isInputCorrect() -> Bool {
        guard isTextFieldsNotEmpty else {
            showEmptyFieldNotification()
            return false
        }
        guard let personsText = personsTextField.text,
              let persons = Int(personsText),
              persons > 0 && persons < 10 else {
            showInvalidPersonsNotification()
            return false
        }
        return true
    }
    
    private func showInvalidPersonsNotification() {
        let alert = UIAlertController(title: "Invalid Persons", message: "Please input more than 1 person and less than 10.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
}

//MARK: Textfield Delegates
extension DetailedViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        distanceTextField.resignFirstResponder()
        fuelTextField.resignFirstResponder()
        priceTextField.resignFirstResponder()
        personsTextField.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
              let rangeOfTextToReplace = Range(range, in: textFieldText) else {
            return false
        }
        var maxCount = 4
        if textField == fuelTextField {
            maxCount = 3
        }
        if textField == personsTextField {
            maxCount = 1
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= maxCount
    }
    
}
