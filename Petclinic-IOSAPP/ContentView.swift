//
//  ContentView.swift
//  Petclinic-002
//
//  Created by Everywhere Silence on 2025/5/20.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    @State private var isShowingPetsView = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {
                Color.white
                    .ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 24) {
                    // Welcome Section
                    Text("Welcome to Petclinic!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 40)
                    Text("Your one-stop solution for pet care. Manage your pets, owners, and appointments easily.")
                        .font(.body)
                        .foregroundColor(.gray)
                        .padding(.bottom, 16)
                    
                    // Placeholder pet images
                    HStack(spacing: 20) {
                        ForEach(0..<3) { _ in
                            Image(systemName: "pawprint.fill")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .foregroundColor(.orange)
                                .background(Color(.systemGray6))
                                .clipShape(Circle())
                        }
                    }
                    Spacer()
                    
                    NavigationLink(destination: PetsListView(), isActive: $isShowingPetsView) {
                        EmptyView()
                    }
                }
                .padding(.horizontal, 24)
                
                // Side Menu
                if showMenu {
                    VStack(alignment: .leading, spacing: 24) {
                        Button("HOME") {}
                        Button("OWNERS") {}
                        Button("PETS") {
                            isShowingPetsView = true
                            withAnimation {
                                showMenu = false
                            }
                        }
                    }
                    .padding(32)
                    .background(Color(.systemGray6))
                    .cornerRadius(16)
                    .shadow(radius: 8)
                    .padding(.top, 80)
                    .padding(.leading, 8)
                    .transition(.move(edge: .leading))
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { withAnimation { showMenu.toggle() } }) {
                        HStack(spacing: 6) {
                            Image(systemName: "leaf.arrow.circlepath")
                                .foregroundColor(.green)
                            Text("Spring")
                                .font(.headline)
                                .foregroundColor(.green)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
