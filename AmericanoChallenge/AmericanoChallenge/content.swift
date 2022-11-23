//
//  content.swift
//  AmericanoChallenge
//
//  Created by Viacheslav on 23/11/22.
//

import Foundation
import SwiftUI

let categoryImages = ["book.circle", "soccerball.circle", "flame.circle", "heart.circle", "bolt.circle", "hammer.circle", "stethoscope.circle", "creditcard.circle", "theatermasks.circle", "popcorn.circle", "house.circle", "car.circle", "tram.circle"]

struct CategoriesTemp: Hashable {
    
    let categoryTempName: String
    let categoryTempIconName: String
}

var categoriesTemp: [CategoriesTemp] = [
    CategoriesTemp(categoryTempName: "Food", categoryTempIconName: "book.circle"),
    CategoriesTemp(categoryTempName: "Household", categoryTempIconName: "house.circle"),
    CategoriesTemp(categoryTempName: "Health", categoryTempIconName: "stethoscope.circle"),
    CategoriesTemp(categoryTempName: "Transport", categoryTempIconName: "car.circle"),
    CategoriesTemp(categoryTempName: "Fun", categoryTempIconName: "popcorn.circle"),
    CategoriesTemp(categoryTempName: "Sport", categoryTempIconName: "soccerball.circle"),
    CategoriesTemp(categoryTempName: "Other", categoryTempIconName: "flame.circle")
]

struct AccountsTemp: Hashable {
    
    let accountTempName: String
    let accountTempIconName: String
    let accountTempAmount: Double
    let accountTempCurrency: String
}

var accountsTemp: [AccountsTemp] = [
    AccountsTemp(accountTempName: "Cash", accountTempIconName: "flame.circle", accountTempAmount: 500, accountTempCurrency: "$"),
    AccountsTemp(accountTempName: "Credit card", accountTempIconName: "creditcard.circle", accountTempAmount: 2500.3, accountTempCurrency: "£"),
    AccountsTemp(accountTempName: "Deposit", accountTempIconName: "bolt.circle", accountTempAmount: 500.32, accountTempCurrency: "€")
]

