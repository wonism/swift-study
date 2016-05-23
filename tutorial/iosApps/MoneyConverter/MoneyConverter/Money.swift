//
//  Money.swift
//  MoneyConverter
//
//  Created by 김재원 on 2016. 5. 22..
//  Copyright © 2016년 Jaewonism. All rights reserved.
//

import Foundation

enum Currency: Int {
    case USD = 0, KRW, JPY, EUR
    
    var ratio:Double {
        get {
            switch self {
            case .USD:
                return 1.0
            case .KRW:
                return 1178.5
            case .JPY:
                return 122.45
            case .EUR:
                return 0.92
            }
        }
    }
    
    var symbol: String {
        get {
            switch self {
            case .USD:
                return "$"
            case .KRW:
                return "₩"
            case .JPY:
                return "¥"
            case .EUR:
                return "€"
            }
        }
    }
}

struct Money {
    var USDollar = 0.0
    
    init (_ _USDollar: Double) {
        USDollar = _USDollar
    }
    
    init (_ amount: Double, currency: Currency) {
        USDollar = amount / currency.ratio
    }
    
    func valueInCurrency(currency: Currency) -> String {
        return "\(currency.symbol)" + "\(USDollar * currency.ratio)"
    }
}

let myMoney = Money(120)
let incomdInKRW = Money(350_000, currency: .KRW)
