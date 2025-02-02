//
//  BudgetAppApp.swift
//  BudgetApp
//
//  Created by Nishant Mehta on 11/09/24.
//

import SwiftUI

@main
struct BudgetAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, CoreDataManager.shared.viewContext)

        }
    }
}
