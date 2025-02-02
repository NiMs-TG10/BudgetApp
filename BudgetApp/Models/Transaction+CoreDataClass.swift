//
//  Transaction+CoreDataClass.swift
//  BudgetApp
//
//  Created by Nishant Mehta on 13/09/24.
//

import Foundation
import CoreData


@obc(tr)

public class TransactionL: NSManagedObject {
    public override func awakeFromInsert() {
        self.dateCreated = Date()
    }
}
