//
//  ViewController.swift
//  taskForITRexGroup
//
//  Created by sleman on 8.02.22.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var flagFirstCurrency: UIImageView!
    @IBOutlet weak var buttonCurrency: UIButton!
    @IBOutlet weak var textFieldBuy: UITextField!
    @IBOutlet weak var textFielSell: UITextField!
    @IBOutlet weak var secondStackView: UIStackView!
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var labelFullDescription: UILabel!
    var currancys: [Currency] = []
    var pikCurrancy : Currency?

    override func viewDidLoad() {
        super.viewDidLoad()
        getUrlSession()

        
        
        
        textFieldBuy.delegate = self
        textFieldBuy.keyboardType = .decimalPad
        textFielSell.delegate = self
        textFielSell.keyboardType = .decimalPad
     
        
        buttonCurrency.layer.cornerRadius = 10
        mainStackView.layer.cornerRadius = 20
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: textFieldBuy.frame.height - 1, width: textFieldBuy.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.black.cgColor
        textFieldBuy.borderStyle = UITextField.BorderStyle.none
        textFieldBuy.layer.addSublayer(bottomLine)
        let bottomLineTwo = CALayer()
        bottomLineTwo.frame = CGRect(x: 0.0, y: textFielSell.frame.height - 1, width: textFielSell.frame.width, height: 1.0)
        bottomLineTwo.backgroundColor = UIColor.black.cgColor
        textFielSell.borderStyle = UITextField.BorderStyle.none
        textFielSell.layer.addSublayer(bottomLineTwo)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let currencyViewController = segue.destination as? CurrencyViewController {
            currencyViewController.remuveCurrency(currancys)
            currencyViewController.delegate = self
        }
    }

    
    @IBAction func textFieldBuyAction(_ sender: UITextField) {
        guard let curOfficialRate = pikCurrancy?.curOfficialRate else { return }
        print("curOfficialRate ", curOfficialRate)
        guard let value = Double(sender.text ?? "") else { return }
        
        let canculater = value * curOfficialRate
        textFielSell.text = String(NSString(format:"%.2f", canculater))
    }
    
    
    
    @IBAction func textFieldCellAction(_ sender: UITextField) {
        
    }
    
    @IBAction func buttonBuyAction() {
        performSegue(withIdentifier: "segue", sender: nil)
    }


    private func getUrlSession() {
        ServiseAPI.apiSingl.fetchUrlSession { [weak self] currancy in
            self?.currancys = currancy
            self?.pikCurrancy = currancy[5]
            DispatchQueue.main.async {
                self?.labelFullDescription.text = self?.createTitleCurrancy((self?.currancys[5])!)
            }
        }
    }
    func createTitleCurrancy(_ currancy: Currency) -> String {
        let title = """
                    \(currancy.curScale) \(currancy.curAbbreviation) = \(currancy.curOfficialRate) BYN
                    """
        return title
    }

}
extension ViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let oldText = textField.text, let r = Range(range, in: oldText) else {
            return true
        }

        let newText = oldText.replacingCharacters(in: r, with: string)
        let isNumeric = newText.isEmpty || (Double(newText) != nil)
        let numberOfDots = newText.components(separatedBy: ".").count - 1

        let numberOfDecimalDigits: Int
        if let dotIndex = newText.firstIndex(of: ".") {
            numberOfDecimalDigits = newText.distance(from: dotIndex, to: newText.endIndex) - 1
        } else {
            numberOfDecimalDigits = 0
        }

        return isNumeric && numberOfDots <= 1 && numberOfDecimalDigits <= 2
    }
    
}


extension ViewController: DelegatReturnSelectCurrency {
    func returnCurrency(_ currency: Currency?) {
        textFieldBuy.text = ""
        textFielSell.text = ""
        guard let currency = currency else { return }
        pikCurrancy = currency
        buttonCurrency.setTitle(currency.curAbbreviation + " >", for: .normal)
        labelFullDescription.text = createTitleCurrancy(currency)
        flagFirstCurrency.image = OtherFuncForWorkWithTableAndCell.otherFuncSingl.getFlagImage(currency.curAbbreviation)
    }
}

