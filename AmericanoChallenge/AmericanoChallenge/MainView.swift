//
//  MainView.swift
//  AmericanoChallenge
//
//  Created by Viacheslav on 16/11/22.
//

import CoreData
import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Flow", systemImage: "list.bullet")
                }
            
            ChartView()
                .tabItem {
                    Label("Chart", systemImage: "chart.pie")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
