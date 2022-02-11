//
//  CurrencyViewController.swift
//  taskForITRexGroup
//
//  Created by sleman on 8.02.22.
//

import UIKit

protocol DelegatReturnSelectCurrency: AnyObject {
    func returnCurrency(_ currency: Currency?)
}

class CurrencyViewController: UIViewController {


    @IBOutlet weak var stackViewCurrency: UIStackView!
    @IBOutlet weak var buttonPostCurrency: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lableChousCurrency: UILabel!
    @IBOutlet weak var imageChousCurrency: UIImageView!

    weak var delegate: DelegatReturnSelectCurrency?
    var currancys: [Currency] = []
    var oldArrayCurrancys: [Currency] = []
    var selectCurrency: Currency?
    let searchController = UISearchController()

    override func viewDidLoad() {
        super.viewDidLoad()
        startSetting()
    }

    @IBAction func buttonPostCurrencyAction() {
        if selectCurrency != nil {
            delegate?.returnCurrency(selectCurrency)
            navigationController?.popViewController(animated: true)
        }
    }

    func remuveCurrency(_ currancy: [Currency]) {
        var newCurrancy = currancy
        for (index, item) in newCurrancy.enumerated() {
            if item.curAbbreviation == "XDR" {
                newCurrancy.remove(at: index)
            }
        }
        currancys = newCurrancy
    }
    private func startSetting(){
        oldArrayCurrancys = currancys
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Введите валюту"
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        definesPresentationContext = true
        buttonPostCurrency.layer.cornerRadius = 20
        stackViewCurrency.layer.cornerRadius = 20
    }
}




