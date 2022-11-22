//
//  AccountsView.swift
//  AmericanoChallenge
//
//  Created by Viacheslav on 16/11/22.
//

import SwiftUI

struct AccountsView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(
        sortDescriptors: [SortDescriptor(\.name)]
    ) var accounts: FetchedResults<Account>
    
    @State private var showAccountFormView = false
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach (accounts) { account in
                    HStack {
                        Image(systemName: account.iconName ?? "folder")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .accessibilityHidden(true)
                        Text(account.name ?? "Unknown")
                        Spacer()
                        Text(account.currency ?? "$")
                        Text(String(format: "%.2f", account.amount))
                            .font(.headline)
                    }
                    .accessibilityElement(children: .combine)
                }
                .onDelete(perform: deleteInput)
            }
            .navigationTitle("Accounts")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    
                    EditButton()
                    
                    Button(action: {
                        showAccountFormView.toggle()
                    }, label: {
                        Image(systemName: "plus")
                    })
                    .sheet (isPresented: $showAccountFormView) {
                        AddAccountView()
                    }
                }
            }
        }
    }
    
    private func deleteInput(offsets: IndexSet) {
        withAnimation {
            offsets.map { accounts[$0]
            }.forEach(moc.delete)
        }
    }
}

struct AccountsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountsView()
    }
}
