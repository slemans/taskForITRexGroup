//
//  CurrencyViewController.swift
//  taskForITRexGroup
//
//  Created by sleman on 8.02.22.
//

import UIKit

class CurrencyViewController: UIViewController {


    @IBOutlet weak var tableView: UITableView!

    var currancys: [Currency] = []
    var oldArrayCurrancys: [Currency] = []

    let searchController = UISearchController()

    override func viewDidLoad() {
        super.viewDidLoad()
        oldArrayCurrancys = currancys
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Введите валюту"
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        definesPresentationContext = true
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
            if currancys.count != oldArrayCurrancys.count{
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
}
//
//extension CurrencyViewController: UISearchBarDelegate {
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if searchBar.text?.isEmpty == true {
//            searchActive = false
//            searchBar.resignFirstResponder() // останавливаем и выходим из searchBar
//            tableView.reloadData()
//        } else {
//            searchActive = true
//            print(searchText)
//
//            var arratString: [String] = []
//            var newArratString: [String] = []
//            for item in currancys {
//                arratString.append(item.curName)
//            }
//
//            for (index, item) in currancys.enumerated() {
//                if item.curName == searchText {
//                    print(item)
//                }
//            }
//            tableView.reloadData()
//        }


//}
