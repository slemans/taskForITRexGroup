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
    var pikCurrancy: Currency?

    override func viewDidLoad() {
        super.viewDidLoad()
        startSetting()
        getUrlSession()
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let currencyViewController = segue.destination as? CurrencyViewController {
            currencyViewController.remuveCurrency(currancys)
            currencyViewController.delegate = self
        }
    }
    @IBAction func textFieldBuyAction(_ sender: UITextField) {
        textFielSell.text = OtherFuncForViewController.otherFuncSingl.getNewValueCunculetion(pikCurrancy, sender.text, true)
    }
    @IBAction func textFieldCellAction(_ sender: UITextField) {
        textFieldBuy.text = OtherFuncForViewController.otherFuncSingl.getNewValueCunculetion(pikCurrancy, sender.text, false)
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
    private func startSetting(){
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
    
}





