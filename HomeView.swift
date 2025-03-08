//
//  HomeView.swift
//  PlayboiFashion
//
//  Created by Playboi In Central on 3/5/25.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationStack {
            ScrollView (.vertical, showsIndicators: true){
                VStack {
                    Banner()
                    CategorySelection()
                        .padding(.top)
                    BrandSelection()
                        .padding(.top, 30)
                    Spacer()
                }
            }
            .toolbar {
                HStack {
                    SearchView()
                        .padding(.trailing, 10)
                    NavigationLink {
                    } label: {
                        Image(systemName: "heart")
                            .foregroundStyle(.black)
                    } .padding(.trailing, 10)
                    NavigationLink {
                    } label: {
                        Image(systemName: "cart")
                            .foregroundStyle(.black)
                    } .padding(.trailing, 10)
                }
            }
        }
    }
}

struct CategorySelection: View {
    let displayImg = ["tshirt","jacket","hat.cap","sunglasses","watch.analog","backpack","shoe.2"]
    let categoryColumns = [
        GridItem(.flexible(), spacing: 3),
        GridItem(.flexible(), spacing: 3),
        GridItem(.flexible(), spacing: 3),
        GridItem(.flexible(), spacing: 3)
    ]
    var body: some View {
        LazyVGrid(columns: categoryColumns, spacing: 30) {
            NavigationLink {
                TshirtView()
            } label: {
                IconCategory(displayImg: "tshirt", displayName: "T-shirt")
            }
            NavigationLink {
                JacketView()
            } label: {
                IconCategory(displayImg: "jacket", displayName: "Jacket")
            }
            NavigationLink {
                HatView()
            } label: {
                IconCategory(displayImg: "hat.cap", displayName: "Hat")
            }
            NavigationLink {
                SunglassesView()
            } label: {
                IconCategory(displayImg: "sunglasses", displayName: "Sunglasses")
            }
            NavigationLink {
                WatchView()
            } label: {
                IconCategory(displayImg: "watch.analog", displayName: "Watch")
            }
            NavigationLink {
                BackpackView()
            } label: {
                IconCategory(displayImg: "backpack", displayName: "Backpack")
            }
            NavigationLink {
                ShoesView()
            } label: {
                IconCategory(displayImg: "shoe.2", displayName: "Shoes")
            }
            NavigationLink {
                WalletView()
            } label: {
                IconCategory(displayImg: "wallet.bifold", displayName: "Wallet")
            }

        }
    }
}
struct BrandSelection: View {
    let images = ["puma_selec","skechers_selec","pedro_selec","havaianas_selec","urbanrevivo_selec","mlb_selec"]
    let brandColumns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    var body: some View {
        VStack (spacing: 5){
            HStack {
                Text("Brand Selection")
                    .font(.title)
                    .foregroundStyle(.black)
                    .fontWeight(.bold)
                Spacer()
                NavigationLink{
                    
                } label: {
                    Text("See more")
                        .foregroundStyle(.black)
                }
            } .padding(.horizontal, 10)
            LazyVGrid(columns: brandColumns, spacing: 10) {
                ForEach(images, id: \.self) {
                    index in
                    NavigationLink {
                        
                    } label: {
                        Image(index)
                            .resizable()
                            .scaledToFit()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
