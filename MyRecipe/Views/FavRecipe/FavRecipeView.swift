//
//  FavRecipeView.swift
//  MyRecipe
//
//  Created by Atakan Başaran on 25.01.2024.
//

import SwiftUI

struct FavRecipeView: View {
    
    @StateObject var recipeFavVM = RecipeFavViewModel()

    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                List(recipeFavVM.savedHits) { recipe in
                    NavigationLink(destination: DetailsView(recipe: recipe, action: {
                        recipeFavVM.deleteRecipe(hit: recipe)
                    }, tintColor: .red, buttonLabel: "Remove From Favorites") ) {
                        RecipeCell(recipe: recipe)
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button(role: .destructive, action: {
                            recipeFavVM.deleteRecipe(hit: recipe)
                        }, label: {
                            Text("Remove")
                        })
                    }
                }
                .listStyle(.plain)
                
                if recipeFavVM.savedHits.isEmpty {
                    EmptyState()
                }
            }
            .navigationTitle("Favorites")
            .alert(AlertContext.removeError.text, isPresented: $recipeFavVM.showRemoveAlert) {
                Button {
                    print("Alert dismissed")
                } label: {
                    Text("OK")
                }
            }
        message: {
            AlertContext.removeError.message
        }
    }
        .task {
            recipeFavVM.getSelectedHits()
        }
    }
    
}


#Preview {
    FavRecipeView()
}
