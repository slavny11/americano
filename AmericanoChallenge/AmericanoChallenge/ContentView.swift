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
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Input.timestamp, ascending: true)]
    ) var inputs: FetchedResults<Input>
    
    var body: some View {
        NavigationView {
            List {
                ForEach (inputs) { input in
                    NavigationLink(destination: Text(input.name ?? "No input")) {
                        Text(input.name ?? "Unknown")
                    }
                }
                .onDelete(perform: deleteInput)
            }
            .navigationTitle("Cash Flow")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    
                    EditButton()
                    
                    Button(action: addInput, label: {
                        Image(systemName: "plus")
                    })
                }
            }
        }
    }
    
    private func deleteInput(offsets: IndexSet) {
        withAnimation {
            offsets.map { inputs[$0]
            }.forEach(moc.delete)
        }
    }
    
    private func addInput() {
        withAnimation {
            let newInput = Input(context: moc)

            newInput.name = "New input"
            newInput.timestamp = Date.now
            
            try? moc.save()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
