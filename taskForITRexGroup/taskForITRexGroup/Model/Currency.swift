//
//  Currency.swift
//  taskForITRexGroup
//
//  Created by sleman on 8.02.22.
//


import UIKit

// MARK: - WelcomeElement
struct Currency: Codable {
    let curID, curScale: Int
    let curAbbreviation, curName: String
    let curOfficialRate: Double

    enum CodingKeys: String, CodingKey {
        case curID = "Cur_ID"
        case curAbbreviation = "Cur_Abbreviation"
        case curScale = "Cur_Scale"
        case curName = "Cur_Name"
        case curOfficialRate = "Cur_OfficialRate"
    }
    
    init?(currency: Currency) {
        curID = currency.curID
        curAbbreviation = currency.curAbbreviation
        curScale = currency.curScale
        curName = currency.curName
        curOfficialRate = currency.curOfficialRate
    }
}


