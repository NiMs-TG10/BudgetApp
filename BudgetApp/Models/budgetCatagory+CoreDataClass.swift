//
//  budgetCatagory+CoreDataClass.swift
//  BudgetApp
//
//  Created by Nishant Mehta on 11/09/24.
//

import Foundation
import CoreData


@objc(BudgetCatagory)

public class BudgetCatagory: NSManagedObject{
    
    public override func awakeFromInsert() {
        self.dateCreated = Date()
    }
    
}
