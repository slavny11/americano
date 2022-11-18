//
//  CategoriesView.swift
//  AmericanoChallenge
//
//  Created by Viacheslav on 18/11/22.
//

import SwiftUI

struct CategoriesView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(
        sortDescriptors: []
    ) var categories: FetchedResults<Category>
    
    @State private var showCategoryFormView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach (categories) { category in
                    HStack {
                        Image(systemName: category.imageName ?? "folder")
                            .resizable()
                            .frame(width: 25, height: 25)
                        Text(category.name ?? "Unknown")
                    }
                }
            }
                .navigationTitle("Categories")
                .toolbar {
                        ToolbarItemGroup(placement: .navigationBarTrailing) {
                            
                            EditButton()
                            
                            Button(action: {
                                showCategoryFormView.toggle()
                            }, label: {
                                Image(systemName: "plus")
                            })
                            .sheet (isPresented: $showCategoryFormView) {
                                AddCategoryView()
                            }
                        }
                    }
        }
        
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
