//
//  ContentView.swift
//  Petclinic-IOSAPP
//
//  Created by Everywhere Silence on 2025/5/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    
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
                    HStack(spacing: 16) {
                        ForEach(0..<3) { _ in
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.gray.opacity(0.2))
                                .frame(width: 80, height: 80)
                                .overlay(
                                    Image(systemName: "pawprint.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40, height: 40)
                                        .foregroundColor(.accentColor)
                                )
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal, 24)
                // Menu Overlay
                if showMenu {
                    VStack(alignment: .leading, spacing: 24) {
                        Button("HOME") {}
                            .font(.title2)
                        Button("OWNERS") {}
                            .font(.title2)
                        Button("PETS") {}
                            .font(.title2)
                    }
                    .padding(32)
                    .background(RoundedRectangle(cornerRadius: 16).fill(Color.white).shadow(radius: 8))
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
                                .foregroundColor(.accentColor)
                            Text("Spring")
                                .font(.headline)
                                .foregroundColor(.accentColor)
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
