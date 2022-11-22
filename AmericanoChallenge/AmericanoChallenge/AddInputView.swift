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
    
    @State private var addCategory: Category?
    
    @FetchRequest(
        sortDescriptors: [SortDescriptor(\.name)]
    ) var accounts: FetchedResults<Account>
    
    @State private var addAccount: Account?
    
    init(moc: NSManagedObjectContext) {
        
            let fetchRequest: NSFetchRequest<Account> = Account.fetchRequest()
            fetchRequest.sortDescriptors = [NSSortDescriptor(keyPath: \Account.name, ascending: true)]
            fetchRequest.predicate = NSPredicate(value: true)
            self._accounts = FetchRequest(fetchRequest: fetchRequest)
        
        let fetchRequest1: NSFetchRequest<Category> = Category.fetchRequest()
        fetchRequest1.sortDescriptors = [NSSortDescriptor(keyPath: \Category.name, ascending: true)]
        fetchRequest1.predicate = NSPredicate(value: true)
        self._categories = FetchRequest(fetchRequest: fetchRequest1)
        
            do {
                let firstAccount = try moc.fetch(fetchRequest)
                self._addAccount = State(initialValue: firstAccount[0])
                
                let firstCategory = try moc.fetch(fetchRequest1)
                self._addCategory = State(initialValue: firstCategory[0])
            } catch {
                fatalError("Uh, fetch problem...")
            }
        }
    
    @State private var addAmount: Float = 0.0

//    @State private var addCurrency = "$"
//    @State private var addAccount = "No name"
    
    var body: some View {
        

            
            Form {
                
                Picker("Category", selection: $addCategory){
                    
                    ForEach (categories) { (category: Category) in
                        HStack {
                            Image(systemName: category.imageName ?? "folder")
                            Text(category.name ?? "Unknown")
                                .tag(category.self)
                        }
                    }
                }
                
                Picker("Account", selection: $addAccount){
                    ForEach (accounts) { (account: Account) in

                        HStack {
                            Image(systemName: account.iconName ?? "folder")
                            Text("\(account.name ?? "Unknown") (\(String(format: "%.2f", account.amount)) \(account.currency ?? "Ee"))")
                        }.tag(account.self)
                    }
                }
                
                HStack {
                    Text(addAccount?.currency ?? "$")
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

            newInput.category = addCategory?.name
            newInput.timestamp = Date.now
            newInput.currency = addAccount?.currency ?? "$"
            newInput.amount = addAmount
            newInput.account = addAccount?.name
            
            try? moc.save()
        }
    }
}

//struct FormView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddInputView(moc: moc)
//    }
//}
