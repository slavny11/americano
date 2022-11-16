//
//  ContentView.swift
//  AmericanoChallenge
//
//  Created by Viacheslav on 16/11/22.
//

import CoreData
import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var inputs: FetchedResults<Input>
    
    var body: some View {
        NavigationView {
            List {
                ForEach (inputs) { input in
                    NavigationLink(destination: Text(input.name ?? "No input")) {
                        Text(input.name ?? "Unknown")
                    }
                }
            }
            .navigationTitle("Title")
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
