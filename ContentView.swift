//
//  ContentView.swift
//  PlayboiFashion
//
//  Created by Playboi In Central on 3/5/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
                    HomeView()
                        .tabItem {
                            Image(systemName: "house")
                            Text("Home")
                        }

                    CategoryView()
                        .tabItem {
                            Image(systemName: "square.grid.2x2")
                            Text("Category")
                        }

                    AccountView()
                        .tabItem {
                            Image(systemName: "person.crop.circle")
                            Text("Account")
                        }
        }
    }
}

#Preview {
    ContentView()
}
