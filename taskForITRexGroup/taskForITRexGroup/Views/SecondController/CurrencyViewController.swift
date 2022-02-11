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
        oldArrayCurrancys = currancys
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Введите валюту"
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        definesPresentationContext = true
        buttonPostCurrency.layer.cornerRadius = 20
        stackViewCurrency.layer.cornerRadius = 20
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


}
extension CurrencyViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        var filterCurrancys: [Currency] = []
        if text.isEmpty == true {
            currancys = oldArrayCurrancys
            tableView.reloadData()
        } else {
            if currancys.count != oldArrayCurrancys.count {
                filterCurrancys = oldArrayCurrancys.filter({ (item: Currency) -> Bool in
                    return item.curName.lowercased().contains(text.lowercased())
                })
            } else {
                filterCurrancys = currancys.filter({ (item: Currency) -> Bool in
                    return item.curName.lowercased().contains(text.lowercased())
                })
            }
            currancys = filterCurrancys
            tableView.reloadData()
        }
    }
}

extension CurrencyViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return currancys.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        let carrenc = currancys[indexPath.row]
        cell.getCurrenc(carrenc.curName, carrenc.curAbbreviation)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let carrenc = currancys[indexPath.row]
        lableChousCurrency.text = carrenc.curAbbreviation
        imageChousCurrency.image = OtherFuncForWorkWithTableAndCell.otherFuncSingl.getFlagImage(carrenc.curAbbreviation)
        selectCurrency = carrenc
    }
}

