//
//  ContentView.swift
//  BudgetApp
//
//  Created by Nishant Mehta on 12/09/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: []) private var budgetCategoryRresults: FetchedResults<BudgetCatagory>
    
    @State private  var isPresented: Bool = false
    
//    @Environment(\.dismiss)
    
    
    var total: Double {
        budgetCategoryRresults.reduce(0) { result , budgetCatagory in
            return result + budgetCatagory.total
            
        }
    }
    var body: some View {
        NavigationStack{
            VStack{
                Text(total as NSNumber , formatter: NumberFormatter.currency)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                BudgetListView(budgetCategoryResults: budgetCategoryRresults,onDeleteBudgetCategory: { budgetCatagory in
                    viewContext.delete(budgetCatagory)
                    do{
                        try viewContext.save()
                    }catch{
                        print(error)
                    }
                })            }
            .sheet(isPresented: $isPresented, content: {
                AddBudgetCategoryView()
            })
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add catagory") {
                        isPresented = true
                    }
                }
            }.padding()
        }
    }
}

#Preview {
    ContentView()
}
