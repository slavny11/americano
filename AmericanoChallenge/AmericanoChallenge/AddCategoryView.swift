//
//  AddCategoryView.swift
//  AmericanoChallenge
//
//  Created by Viacheslav on 18/11/22.
//

import CoreData
import SwiftUI
import Foundation

struct AddCategoryView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @Environment(\.presentationMode) var presentationMode
    
    @FetchRequest(
        sortDescriptors: [SortDescriptor(\.name)]
    ) var categories: FetchedResults<Category>
    
    @State private var addCategoryName = "New category"
    @State private var addCategoryImageName = "folder"
    
    let categoryImages = ["book.circle", "soccerball.circle", "flame.circle", "heart.circle", "bolt.circle", "hammer.circle", "stethoscope.circle", "creditcard.circle", "theatermasks.circle", "popcorn.circle", "house.circle", "car.circle", "tram.circle"]
    
    var body: some View {
        
        Form {
            
            TextField("Enter category name", text: $addCategoryName)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach (categoryImages, id: \.self) { image in
                        
                        Button {
                            addCategoryImageName = image
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

            Button ("Add") {
                addCategory()
                presentationMode.wrappedValue.dismiss()
            }
            
        }
    }
    
    private func addCategory() {
        withAnimation {
            let newCategory = Category(context: moc)

            newCategory.name = addCategoryName
            newCategory.imageName = addCategoryImageName
            
            try? moc.save()
        }
    }
    
}

struct AddCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        AddCategoryView()
    }
}
