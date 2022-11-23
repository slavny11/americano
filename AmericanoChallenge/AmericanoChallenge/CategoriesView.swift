//
//  CategoriesView.swift
//  AmericanoChallenge
//
//  Created by Viacheslav on 18/11/22.
//

import CoreData
import SwiftUI
import Foundation

struct CategoriesView: View {
    
//    @Environment(\.managedObjectContext) var moc
//
//    @FetchRequest(
//        sortDescriptors: [SortDescriptor(\.name)]
//    ) var categories: FetchedResults<Category>
//
//    @State private var showCategoryFormView = false
    @State var categories: [CategoriesTemp] = categoriesTemp
    
    var body: some View {
        NavigationView {
            List {
                ForEach (categories, id: \.self) { category in
                    HStack {
                        Image(systemName: category.categoryTempIconName)
                            .resizable()
                            .frame(width: 25, height: 25)
                            .accessibilityHidden(true)
                        Text(category.categoryTempName)
                    }
                    .accessibilityElement(children: .combine)
                }
//                .onDelete(perform: deleteInput)
            }
            .navigationTitle("Categories")
//            .toolbar {
//                ToolbarItemGroup(placement: .navigationBarTrailing) {
//
//                    EditButton()
//                        .accessibilityLabel("Edit categories list")
//
//                    Button(action: {
//                        showCategoryFormView.toggle()
//                    }, label: {
//                        Image(systemName: "plus")
//                    })
//                    .accessibilityLabel("Add new category")
//                    .sheet (isPresented: $showCategoryFormView) {
//                        AddCategoryView()
//                    }
//                }
//            }
        }
        
    }
//    private func deleteInput(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { categories[$0]
//            }.forEach(moc.delete)
//        }
//    }
}



struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
