//
//  FormView.swift
//  AmericanoChallenge
//
//  Created by Viacheslav on 17/11/22.
//

import CoreData
import SwiftUI
import Foundation

struct AddInputView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @Environment(\.presentationMode) var presentationMode
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Input.timestamp, ascending: false)]
    ) var inputs: FetchedResults<Input>
    
    @FetchRequest(
        sortDescriptors: []
    ) var categories: FetchedResults<Category>
    
    @State private var addAmount: Float = 0.0
    @State private var addCategory = "Basic"
    @State private var addCurrency = "$"
    @State private var addAccount = "Basic"
    
    var body: some View {
        

            
            Form {
                HStack {
                    Text(addCurrency)
                    TextField("Amount", value: $addAmount, format: .number)
                        .keyboardType(.decimalPad)
                }
                Picker("Category", selection: $addCategory){
                    
                    ForEach (categories) { category in
                        HStack {
                            Image(systemName: category.imageName ?? "folder")
                            Text(category.name ?? "Unknown")
                        }
                        .tag(category)
                    }
                }
                Picker("Account", selection: $addAccount){
                    Text("Account 1")
                    Text("Account 2")
                    Text("Account 3")
                }
                Button ("Add") {
                    addInput()
                    presentationMode.wrappedValue.dismiss()
                }
                
            }
        
    }

    
    private func addInput() {
        withAnimation {
            let newInput = Input(context: moc)

            newInput.category = addCategory
            newInput.timestamp = Date.now
            newInput.currency = addCurrency
            newInput.amount = addAmount
            
            try? moc.save()
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        AddInputView()
    }
}
