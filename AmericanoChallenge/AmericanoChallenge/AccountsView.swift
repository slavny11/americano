//
//  AccountsView.swift
//  AmericanoChallenge
//
//  Created by Viacheslav on 16/11/22.
//

import SwiftUI

struct AccountsView: View {
    
    var body: some View {
        NavigationView {
            Text("Here accounts")
            .navigationTitle("Accounts")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    
                    Button(action: {
                        print("Edit tap")
                    }, label: {
                        Text("Edit")
                    })
                    
                    Button(action: {
                        print("Edit add")
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            }
        }
    }
}

struct AccountsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountsView()
    }
}
