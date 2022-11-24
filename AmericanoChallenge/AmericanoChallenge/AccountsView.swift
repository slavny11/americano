//
//  AccountsView.swift
//  AmericanoChallenge
//
//  Created by Viacheslav on 16/11/22.
//

import SwiftUI

struct AccountsView: View {
    
    //    @Environment(\.managedObjectContext) var moc
    //    
    //    @FetchRequest(
    //        sortDescriptors: [SortDescriptor(\.name)]
    //    ) var accounts: FetchedResults<Account>
    //    
    //    @State private var showAccountFormView = false
    
    @State var accounts: [AccountsTemp] = accountsTemp
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach (accounts, id: \.self) { account in
                    HStack {
                        Image(systemName: account.accountTempIconName)
                            .resizable()
                            .frame(width: 25, height: 25)
                            .accessibilityHidden(true)
                        Text(account.accountTempName)
                        Spacer()
                        Text(account.accountTempCurrency)
                        Text((String(format: "%.2f", account.accountTempAmount)))
                            .font(.headline)
                    }
                    .accessibilityElement(children: .combine)
                    .accessibilityLabel("Account \(account.accountTempName) with \(String(format: "%.2f", account.accountTempAmount)) \(account.accountTempCurrency)")
                }
                //                .onDelete(perform: deleteInput)
            }
            .navigationTitle("Accounts")
            //            .toolbar {
            //                ToolbarItemGroup(placement: .navigationBarTrailing) {
            //
            //                    EditButton()
            //                        .accessibilityLabel("Edit accounts")
            //
            //                    Button(action: {
            //                        showAccountFormView.toggle()
            //                    }, label: {
            //                        Image(systemName: "plus")
            //                    })
            //                    .accessibilityLabel("Add new account")
            //                    .sheet (isPresented: $showAccountFormView) {
            //                        AddAccountView()
            //                    }
            //                }
            //            }
        }
    }
    
    //    private func deleteInput(offsets: IndexSet) {
    //        withAnimation {
    //            offsets.map { accounts[$0]
    //            }.forEach(moc.delete)
    //        }
    //    }
}

struct AccountsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountsView()
    }
}
