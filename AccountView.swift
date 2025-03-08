//
//  AccountView.swift
//  PlayboiFashion
//
//  Created by Playboi In Central on 3/7/25.
//

import SwiftUI

struct AccountView: View {
    let columns = [
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1),
        ]
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: true) {
                NavigationLink {
                    ProfileView()
                } label: {
                    ProfileCard()
                        .foregroundStyle(.black)
                }
                .padding()
                LazyVGrid(columns: columns, spacing: 30) {
                    NavigationLink {
                        
                    } label: {
                        OrderCard()
                            .font(.title)
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                    }
                    
                    NavigationLink {

                    } label: {
                        ChatCard()
                            .font(.title)
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                    }
                    
                    NavigationLink {

                    } label: {
                        PolicyCard()
                            .font(.title)
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                    }
                    
            }
                .padding()
                Divider()
                    .padding(.top)
                Button {
                    
                } label: {
                    LogOutButton()
                        .foregroundStyle(.red)
                }
                .padding(.horizontal)
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("ACCOUNT")
                        .font(.title)
                        .foregroundStyle(.black)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
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
}

struct ProfileCard: View {
    var body: some View {
        HStack(alignment: .center) {
            Image("avatar_without_img")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text("Hi,")
                Text("Playboi In Central")
                    .font(.title2)
                    .fontWeight(.semibold)
                HStack {
                    Text("member of")
                    Text("Playboi Fashion")
                        .fontWeight(.semibold)
                }
            }
            Spacer()
                Image(systemName: "chevron.right")
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(.white)
                .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 4)
        )
    }
}

struct OrderCard: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "truck.box")
            Text("Order")
        } .padding(40)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(.white)
                .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 4)
        )
            }
}

struct ChatCard: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "ellipsis.message")
            Text("Chat")
        } .padding(40)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(.white)
                .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 4)
        )
            }
}

struct PolicyCard: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "info.circle")
            Text("Policy")
        } .padding(40)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(.white)
                .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 4)
        )
            }
}

struct LogOutButton: View {
    var body: some View {
        HStack {
            Image(systemName: "person.circle")
            Text("Log out")
            Spacer()
            Image(systemName: "rectangle.portrait.and.arrow.right")
        }
        .font(.title3)
        .fontWeight(.bold)
            }
}


#Preview {
    AccountView()
}
