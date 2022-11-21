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
        sortDescriptors: [SortDescriptor(\.name)]
    ) var categories: FetchedResults<Category>
    
    @FetchRequest(
        sortDescriptors: [SortDescriptor(\.name)]
    ) var accounts: FetchedResults<Account>
    
    @State private var addAmount: Float = 0.0
    @State private var addCategory = "Basic"
    @State private var addCurrency = "$"
    @State private var addAccount = "No name"
    
    var body: some View {
        

            
            Form {
                
                Picker("Category", selection: $addCategory){
                    
                    ForEach (categories) { (category: Category) in
                        HStack {
                            Image(systemName: category.imageName ?? "folder")
                            Text(category.name ?? "Unknown")
                        }
                        .tag(category)
                    }
                }
                
                Picker("Account", selection: $addAccount){
                    ForEach (accounts) { account in
                        HStack {
                            Image(systemName: account.iconName ?? "folder")
                            Text(account.name ?? "Unknown")
                            Text(String(format: "%.2f", account.amount))
                            Text(account.currency ?? "Ee")
                        }
                        .tag(account)
                    }
                }
                
                HStack {
                    Text(addCurrency)
                    TextField("Amount", value: $addAmount, format: .number)
                        .keyboardType(.decimalPad)
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
            newInput.account = addAccount
            
            try? moc.save()
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        AddInputView()
    }
}
