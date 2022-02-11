//
//  TableViewCell.swift
//  taskForITRexGroup
//
//  Created by sleman on 8.02.22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var currencyAbbreviation: UILabel!
    @IBOutlet weak var flagCurrency: UIImageView!
    @IBOutlet weak var codeCurryncy: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func getCurrenc(_ name: String, _ abbreviation: String) {
        codeCurryncy.text = name
        currencyAbbreviation.text = abbreviation
        flagCurrency.image = OtherFuncForWorkWithTableAndCell.otherFuncSingl.getFlagImage(abbreviation)
    }
}
