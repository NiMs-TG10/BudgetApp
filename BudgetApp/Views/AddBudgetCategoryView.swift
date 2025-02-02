//
//  AddBudgetCategoryView.swift
//  BudgetApp
//
//  Created by Nishant Mehta on 11/09/24.
//

import SwiftUI

struct AddBudgetCategoryView: View {
    
    @State private  var title:String = ""
    @State private var total: Double = 100
    @State private var message: [String] = []
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    
    var isFormValid: Bool{
        message.removeAll()
        if title.isEmpty{
            message.append("Title is required")
            
        }
        if total <= 0 {
            message.append("Tottal should be greater than 0")
        }
        return message.count == 0
        
    }
    
    private func save(){
        let budgetCategory = BudgetCatagory(context: viewContext)
        budgetCategory.title = title
        budgetCategory.total = total
        
        //save the context
        
        do {
            try viewContext.save()
            dismiss()
            
        }catch {
            print(error.localizedDescription)
        }
    }
    
    var body: some View {
        NavigationStack{
            
            
            
            Form{
                TextField("Title", text: $title)
                Slider(value: $total, in: 0...500, step: 5){
                    Text("Total")
                    
                } minimumValueLabel: {
                    Text("$0")
                } maximumValueLabel: {
                    Text("$500")
                }
                
                Text(total as NSNumber, formatter: NumberFormatter.currency)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment: .center)
                
                ForEach(message ,id:\.self) { message in
                    Text(message)
                }
            }.toolbar {
                ToolbarItem(placement: .topBarLeading){
                    Button("Cancle"){
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing ){
                    Button("Save"){
                        if isFormValid {
                            save()
                            
                        }
                        
                        
                    }
                }
                
            }
        }
    }
}


#Preview {
    AddBudgetCategoryView()
}
