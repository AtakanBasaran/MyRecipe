//
//  ContentView.swift
//  MyRecipe
//
//  Created by Atakan Başaran on 29.11.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    @State private var searchText = "" //update the view with State property

    var body: some View {
        NavigationStack {
            List(networkManager.recipes) { recipe in
                let foodDest = recipe.recipe
                
                NavigationLink(destination: DetailsView(imageUrl: foodDest.image, label: foodDest.label, ingredientLines: foodDest.ingredientLines, calories: foodDest.calories, totalTime: foodDest.totalTime, url: foodDest.url)) {
                    
                    VStack(alignment: .leading) {
                        Text(foodDest.label)
                            .fontWeight(.semibold)
                            .foregroundStyle(.blue)
                        
                        HStack {
                            Text("Calories: \(String(format: "%.0f", foodDest.calories))")
                            Spacer()
                            Text("\(foodDest.totalTime) min")
                        }
                    }
                }
            }
            .listStyle(.sidebar) // Ensure plain list style
            .navigationBarItems(trailing: SearchBar(text: $searchText, onSearch: {
                self.networkManager.fetchData(category: self.searchText)
                self.searchText = ""
                
            }))
            .navigationBarTitle("MyRecipe", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "fork.knife.circle")
                }
            }
        }
        .onAppear(perform: { //Performs before view opens
            self.networkManager.fetchData(category: "")
        })
    }
}



#Preview {
    ContentView()
}
