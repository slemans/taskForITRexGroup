//
//  TableViewAndCell.swift
//  taskForITRexGroup
//
//  Created by sleman on 9.02.22.
//

import UIKit

class OtherFuncForWorkWithTableAndCell {
    static var otherFuncSingl = OtherFuncForWorkWithTableAndCell()
    private init() {}
    
    func getFlagImage(_ flag: String) -> UIImage {
        var image: UIImage
        switch flag {
        case "AUD":
            image = #imageLiteral(resourceName: "au")
        case "AMD":
            image = #imageLiteral(resourceName: "am")
        case "UAH":
            image = #imageLiteral(resourceName: "ua")
        case "DKK":
            image = #imageLiteral(resourceName: "dk")
        case "USD":
            image = #imageLiteral(resourceName: "usd")
        case "EUR":
            image = #imageLiteral(resourceName: "evro")
        case "PLN":
            image = #imageLiteral(resourceName: "pl")
        case "JPY":
            image = #imageLiteral(resourceName: "jp")
        case "IRR":
            image = #imageLiteral(resourceName: "ie")
        case "ISK":
            image = #imageLiteral(resourceName: "is")
        case "CAD":
            image = #imageLiteral(resourceName: "ca")
        case "CNY":
            image = #imageLiteral(resourceName: "cn")
        case "KWD":
            image = #imageLiteral(resourceName: "kw")
        case "MDL":
            image = #imageLiteral(resourceName: "md")
        case "NZD":
            image = #imageLiteral(resourceName: "nz")
        case "NOK":
            image = #imageLiteral(resourceName: "no")
        case "RUB":
            image = #imageLiteral(resourceName: "ru")
        case "SGD":
            image = #imageLiteral(resourceName: "sg")
        case "KGS":
            image = #imageLiteral(resourceName: "kg")
        case "KZT":
            image = #imageLiteral(resourceName: "kz")
        case "TRY":
            image = #imageLiteral(resourceName: "tr")
        case "GBP":
            image = #imageLiteral(resourceName: "gb")
        case "CZK":
            image = #imageLiteral(resourceName: "cz")
        case "SEK":
            image = #imageLiteral(resourceName: "ch")
        case "CHF":
            image = #imageLiteral(resourceName: "se")
        default:
            image = #imageLiteral(resourceName: "bg")
        }
        return image
    }
    
}
