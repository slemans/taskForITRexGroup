//
//  IconFlag.swift
//  taskForITRexGroup
//
//  Created by sleman on 11.02.22.
//

import Foundation

struct IconFlag {
    let nameCurrency: String
    var iconNameString: String {
        switch nameCurrency {
        case "AUD": return "au"
        case "AMD": return "am"
        case "UAH": return "ua"
        case "DKK": return "dk"
        case "USD": return "usd"
        case "EUR": return "evro"
        case "PLN": return "pl"
        case "JPY": return "jp"
        case "IRR": return "ie"
        case "ISK": return "is"
        case "CAD": return "ca"
        case "CNY": return "cn"
        case "KWD": return "kw"
        case "MDL": return "md"
        case "NZD": return "nz"
        case "NOK": return "no"
        case "RUB": return "ru"
        case "SGD": return "sg"
        case "KGS": return "kg"
        case "KZT": return "kz"
        case "GBP": return "gb"
        case "CZK": return "cz"
        case "SEK": return "se"
        case "CHF": return "ch"
        case "TRY": return "tr"
        default:
            return "bg"
        }
    }
    init(name: String) {
        nameCurrency = name
    }
}
