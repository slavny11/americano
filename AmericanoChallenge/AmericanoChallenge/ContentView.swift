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
        sortDescriptors: [NSSortDescriptor(keyPath: \Input.timestamp, ascending: false)]
    ) var inputs: FetchedResults<Input>
    
    @State private var showFormView = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                List {
                    Section {
                        ForEach (inputs) { input in
                            RowView(input: input)
                        }
                        .onDelete(perform: deleteInput)
                    } header: {
                        Text ("November")
                    }
                }
                .listStyle(.insetGrouped)
            }
            .navigationTitle("Cash Flow")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    
                    EditButton()
                    
                    Button {
                        showFormView.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet (isPresented: $showFormView) {
                        AddInputView()
                    }
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

            newInput.category = "New input"
            newInput.timestamp = Date.now
            newInput.currency = "$"
            newInput.amount = 30
            
            try? moc.save()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
