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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}

extension CurrencyViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return currancys.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        let carrenc = currancys[indexPath.row]
        cell.getCurrenc(code: carrenc.curCode, flag: "нет")
        return cell
    }
}
