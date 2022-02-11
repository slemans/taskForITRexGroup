//
//  ExtensionCurrencyViewController.swift
//  taskForITRexGroup
//
//  Created by sleman on 11.02.22.
//

import UIKit

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
