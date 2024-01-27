//
//  RecipeTabView.swift
//  MyRecipe
//
//  Created by Atakan Başaran on 25.01.2024.
//

import SwiftUI

struct RecipeTabView: View {
    
    var body: some View {
        
        TabView {
            
            RecipeView()
                .tabItem {
                    Label("Recipe", systemImage: "fork.knife.circle")
                }
            
            FavRecipeView()
                .tabItem {
                    Label("Favorites", systemImage: "bookmark")
                }
        }
        
    }
}

#Preview {
    RecipeTabView()
}
