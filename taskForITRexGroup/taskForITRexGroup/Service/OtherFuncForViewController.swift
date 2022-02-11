//
//  OtherFuncForViewController.swift
//  taskForITRexGroup
//
//  Created by sleman on 11.02.22.
//

import UIKit

class OtherFuncForViewController {
    static var otherFuncSingl = OtherFuncForViewController()
    private init() {}
    
    func getNewValueCunculetion(_ currency: Currency?, _ text: String?, _ byOrSell: Bool) -> String{
        var canculater = 0.0
        if let currency = currency,
           let value = Double(text ?? ""){
            if byOrSell == true {
                if currency.curScale > 1 {
                    canculater = value * (currency.curOfficialRate / Double(currency.curScale))
                } else {
                    canculater = value * currency.curOfficialRate
                }
            } else {
                if currency.curScale > 1 {
                    canculater = value / (currency.curOfficialRate / Double(currency.curScale))
                } else {
                    canculater = value / currency.curOfficialRate
                }
            }
        }
        return String(NSString(format: "%.2f", canculater))
    }
    
}
