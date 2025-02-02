//
//  BudgetListView.swift
//  BudgetApp
//
//  Created by Nishant Mehta on 12/09/24.
//

import SwiftUI

struct BudgetListView: View {
    
    let budgetCategoryResults: FetchedResults<BudgetCatagory>
    let onDeleteBudgetCategory: (BudgetCatagory) -> Void
    var body: some View {
        List{
            if !budgetCategoryResults.isEmpty {
                ForEach(budgetCategoryResults) { budgetCategory in
                    HStack{
                        Text(budgetCategory.title ?? "")
                        Spacer()
                        VStack{
                            Text(budgetCategory.total as NSNumber, formatter: NumberFormatter.currency)
                        }
                    }
                }
                .onDelete(perform: { indexSet in
                    indexSet.map{ budgetCategoryResults[$0]}.forEach(onDeleteBudgetCategory)
                })
                
            } else {
                Text("No budget categories exists.")
            }
        }
    }
}
//
//#Preview {
//    BudgetListView()
//}
