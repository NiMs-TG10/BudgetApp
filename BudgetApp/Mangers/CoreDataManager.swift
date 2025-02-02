//
//  CoreDataManager.swift
//  BudgetApp
//
//  Created by Nishant Mehta on 11/09/24.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    private var presistentContainer: NSPersistentContainer
    
    private init(){
        presistentContainer = NSPersistentContainer(name: "BudgetModel")
        presistentContainer.loadPersistentStores { description , error in
            if let error {
                fatalError("Unable to initialize Core data stack \(error)")
            }
        }
    }
    
    var viewContext: NSManagedObjectContext {
        presistentContainer.viewContext
    }
}
