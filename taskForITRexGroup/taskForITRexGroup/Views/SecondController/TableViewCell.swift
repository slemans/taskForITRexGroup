//
//  TableViewCell.swift
//  taskForITRexGroup
//
//  Created by sleman on 8.02.22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var flagCurrency: UIImageView!
    @IBOutlet weak var codeCurryncy: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func getCurrenc(code: String, flag: String){
        codeCurryncy.text = code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
