//
//  PetsListView.swift
//  Petclinic-IOSAPP
//
//  Created by Everywhere Silence on 2025/5/22.
//

import SwiftUI

struct PetsListView: View {
    // Sample pet data structure
    struct Pet: Identifiable {
        let id = UUID()
        let name: String
        let type: String
        let age: Int
        let owner: String
    }
    
    // Sample pet data
    let pets = [
        Pet(name: "Max", type: "Dog", age: 3, owner: "John Smith"),
        Pet(name: "Bella", type: "Cat", age: 2, owner: "Emily Jones"),
        Pet(name: "Charlie", type: "Dog", age: 5, owner: "Michael Brown"),
        Pet(name: "Lucy", type: "Bird", age: 1, owner: "Sarah Davis"),
        Pet(name: "Oliver", type: "Rabbit", age: 2, owner: "David Wilson")
    ]
    
    var body: some View {
        List {
            Text("Pets List")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.vertical)
                .listRowSeparator(.hidden)
            
            ForEach(pets) { pet in
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Image(systemName: getPetIcon(for: pet.type))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.orange)
                            .padding(8)
                            .background(Color(.systemGray6))
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text(pet.name)
                                .font(.headline)
                            Text(pet.type)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .trailing) {
                            Text("Age: \(pet.age)")
                                .font(.caption)
                            Text("Owner: \(pet.owner)")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding(.vertical, 8)
            }
        }
        .navigationTitle("Pets")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // Function to get appropriate system image for pet type
    func getPetIcon(for type: String) -> String {
        switch type.lowercased() {
        case "dog":
            return "dog"
        case "cat":
            return "cat"
        case "bird":
            return "bird"
        default:
            return "pawprint.fill"
        }
    }
}

#Preview {
    NavigationView {
        PetsListView()
    }
}
