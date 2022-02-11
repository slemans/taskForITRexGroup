//
//  ExtensionViewController.swift
//  taskForITRexGroup
//
//  Created by sleman on 11.02.22.
//
import UIKit

extension ViewController: UITextFieldDelegate {
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
        buttonCurrency.setTitle(currency.curAbbreviation, for: .normal)
        labelFullDescription.text = createTitleCurrancy(currency)
        flagFirstCurrency.image = OtherFuncForWorkWithTableAndCell.otherFuncSingl.getFlagImage(currency.curAbbreviation)
    }
    func createTitleCurrancy(_ currancy: Currency) -> String {
        let title = """
                    \(currancy.curScale) \(currancy.curAbbreviation) = \(currancy.curOfficialRate) BYN
                    """
        return title
    }
}
