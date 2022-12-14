//
//  AddAccountView.swift
//  AmericanoChallenge
//
//  Created by Viacheslav on 20/11/22.
//

import CoreData
import SwiftUI
import Foundation

struct AddAccountView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @Environment(\.presentationMode) var presentationMode
    
    @FetchRequest(
        sortDescriptors: [SortDescriptor(\.name)]
    ) var accounts: FetchedResults<Account>
    
    @State private var addAccountName = "New account"
    @State private var addAccountIconName = "folder"
    @State private var addAccountBalance: Float = 0
    @State private var addAccountCurrency = "$"
    
    let accountImages = ["book.circle", "soccerball.circle", "flame.circle", "heart.circle", "bolt.circle", "hammer.circle", "stethoscope.circle", "creditcard.circle", "theatermasks.circle", "popcorn.circle", "house.circle", "car.circle", "tram.circle"]
    
    let accountCurrencies = ["$": "USD",
                             "€": "EUR",
                             "¥": "JPY",
                             "P": "RUR"]
    
    var body: some View {
        
        Form {
            
            Picker("Currency", selection: $addAccountCurrency){
                
                ForEach (accountCurrencies.sorted(by: >), id: \.key) { currency, key in
                    Text("\(key) \(currency)")
                }
                
            }
            .accessibilityLabel("Choose one from the list")
            
            TextField("Enter account name", text: $addAccountName)
                .accessibilityLabel("Enter account name")
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach (accountImages, id: \.self) { image in
                        
                        Button {
                            addAccountIconName = image
                            print(image)
                        } label: {
                            Image(systemName: image)
                                .resizable()
                                .frame(width: 25, height:25)
                                .padding(.bottom)
                        }
                    }
                }
                .frame(height: 50)
                .accessibilityHidden(true)
                
            }
            
            TextField("Balance", value: $addAccountBalance, format: .number)
                .keyboardType(.decimalPad)
                .accessibilityLabel("Enter account balance")
            
            
            
            Button ("Add") {
                addAccount()
                presentationMode.wrappedValue.dismiss()
            }
            .accessibilityLabel("Add new account")
            
        }
        
    }
    
    private func addAccount() {
        withAnimation {
            let newAccount = Account(context: moc)
            
            newAccount.name = addAccountName
            newAccount.iconName = addAccountIconName
            newAccount.currency = addAccountCurrency
            newAccount.amount = addAccountBalance
            
            try? moc.save()
        }
    }
}

struct AddAccountView_Previews: PreviewProvider {
    static var previews: some View {
        AddAccountView()
    }
}
