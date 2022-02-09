//
//  Currency.swift
//  taskForITRexGroup
//
//  Created by sleman on 8.02.22.
//


import Foundation

// MARK: - WelcomeElement
struct Currency: Codable {
    let curID, curParentID: Int
    let curCode, curAbbreviation, curName, curNameBel: String
    let curNameEng, curQuotName, curQuotNameBel, curQuotNameEng: String
    let curNameMulti, curNameBelMulti, curNameEngMulti: String
    let curScale, curPeriodicity: Int
    let curDateStart, curDateEnd: String

    enum CodingKeys: String, CodingKey {
        case curID = "Cur_ID"
        case curParentID = "Cur_ParentID"
        case curCode = "Cur_Code"
        case curAbbreviation = "Cur_Abbreviation"
        case curName = "Cur_Name"
        case curNameBel = "Cur_Name_Bel"
        case curNameEng = "Cur_Name_Eng"
        case curQuotName = "Cur_QuotName"
        case curQuotNameBel = "Cur_QuotName_Bel"
        case curQuotNameEng = "Cur_QuotName_Eng"
        case curNameMulti = "Cur_NameMulti"
        case curNameBelMulti = "Cur_Name_BelMulti"
        case curNameEngMulti = "Cur_Name_EngMulti"
        case curScale = "Cur_Scale"
        case curPeriodicity = "Cur_Periodicity"
        case curDateStart = "Cur_DateStart"
        case curDateEnd = "Cur_DateEnd"
    }
    init?(currency: Currency) {
        curID = currency.curID
        curParentID = currency.curParentID
        curCode = currency.curCode
        curAbbreviation = currency.curAbbreviation
        curName = currency.curName
        curNameBel = currency.curNameBel
        curNameEng = currency.curNameEng
        curQuotName = currency.curQuotName
        curQuotNameBel = currency.curQuotNameBel
        curQuotNameEng = currency.curQuotNameEng
        curNameMulti = currency.curNameMulti
        curNameBelMulti = currency.curNameBelMulti
        curNameEngMulti = currency.curNameEngMulti
        curScale = currency.curScale
        curPeriodicity = currency.curPeriodicity
        curDateStart = currency.curDateStart
        curDateEnd = currency.curDateEnd
    }
}
