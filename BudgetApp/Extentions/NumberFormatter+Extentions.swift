//
//  NumberFormatter+Extentions.swift
//  BudgetApp
//
//  Created by Nishant Mehta on 12/09/24.
//

import Foundation


extension NumberFormatter {
    static var currency: NumberFormatter{
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = .min
        return formatter
    }
}
