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
    
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Input.timestamp, ascending: false)]
//    ) var inputs: FetchedResults<Input>
//
//    @FetchRequest(
//        sortDescriptors: [SortDescriptor(\.name)]
//    ) var categories: FetchedResults<Category>
//
//    @State private var addCategory: Category?
//
//    @FetchRequest(
//        sortDescriptors: [SortDescriptor(\.name)]
//    ) var accounts: FetchedResults<Account>
//
//    @State private var addAccount: Account?
//
//    init(moc: NSManagedObjectContext) {
//
//            let fetchRequest: NSFetchRequest<Account> = Account.fetchRequest()
//            fetchRequest.sortDescriptors = [NSSortDescriptor(keyPath: \Account.name, ascending: true)]
//            fetchRequest.predicate = NSPredicate(value: true)
//            self._accounts = FetchRequest(fetchRequest: fetchRequest)
//
//        let fetchRequest1: NSFetchRequest<Category> = Category.fetchRequest()
//        fetchRequest1.sortDescriptors = [NSSortDescriptor(keyPath: \Category.name, ascending: true)]
//        fetchRequest1.predicate = NSPredicate(value: true)
//        self._categories = FetchRequest(fetchRequest: fetchRequest1)
//
//            do {
//                let firstAccount = try moc.fetch(fetchRequest)
//                self._addAccount = State(initialValue: firstAccount[0])
//
//                let firstCategory = try moc.fetch(fetchRequest1)
//                self._addCategory = State(initialValue: firstCategory[0])
//            } catch {
//                fatalError("Uh, fetch problem...")
//            }
//        }
    
    var categories: [CategoriesTemp] = categoriesTemp
    var accounts: [AccountsTemp] = accountsTemp
    
    @State private var addCategory = CategoriesTemp(categoryTempName: "Unknown", categoryTempIconName: "Unknown")
    @State private var addAccount = AccountsTemp(accountTempName: "Unknown", accountTempIconName: "Unknown", accountTempAmount: 0, accountTempCurrency: "$")
    
    @State private var addAmount: Float = 0.0

//    @State private var addCurrency = "$"
//    @State private var addAccount = "No name"
    
    var body: some View {
        
            
            Form {
                
                Picker("Category", selection: $addCategory){
//                    Text("No Option").tag(Optional<Category>(nil))
                    ForEach (categories, id: \.self) { category in
                        HStack {
                            Image(systemName: category.categoryTempIconName)
                                .accessibilityHidden(true)
                            Text(category.categoryTempName)
                        }
                        .tag(category)
                    }
                }
                .accessibilityLabel("Choose one from the list")
                
                Picker("Account", selection: $addAccount){
                    ForEach (accounts, id: \.self) { account in
//                        Text("No Option").tag(Optional<Account>(nil))
                        HStack {
                            Image(systemName: account.accountTempIconName)
                                .accessibilityHidden(true)
                            Text("\(account.accountTempName) (\(String(format: "%.2f", account.accountTempAmount)) \(account.accountTempCurrency))")
                        }
                        .tag(account)
                    }
                }
                .accessibilityLabel("Choose one from the list")
                
                HStack {
                    Text(addAccount.accountTempCurrency)
                        .accessibilityLabel(addAccount.accountTempCurrency)
                    TextField("Amount", value: $addAmount, format: .number)
                        .keyboardType(.decimalPad)
                        .accessibilityLabel("Enter amount of money")
                }
                
                
                Button ("Add") {
                    addInput()
                    presentationMode.wrappedValue.dismiss()
                }
                .accessibilityLabel("Add operation")
                
            }
        
    }

    
    private func addInput() {
        withAnimation {
            let newInput = Input(context: moc)

            newInput.category = addCategory.categoryTempName
            newInput.imageName = addCategory.categoryTempIconName
            newInput.timestamp = Date.now
            newInput.currency = addAccount.accountTempCurrency
            newInput.amount = addAmount
            newInput.account = addAccount.accountTempName
            
            try? moc.save()
        }
    }
}

//struct FormView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddInputView(moc: moc)
//    }
//}
