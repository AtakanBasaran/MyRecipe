//
//  ContentView.swift
//  MyRecipe
//
//  Created by Atakan Başaran on 29.11.2023.
//

import SwiftUI

struct RecipeView: View {
    
    @StateObject var recipeVM = RecipeViewModel()
    @State private var searchText = "" //update the view with State property
    @StateObject var recipeFavVM = RecipeFavViewModel()
    @StateObject var networkMonitor = NetworkMonitor()
    

    var body: some View {
        
        
        ZStack {
            NavigationStack {
                List(recipeVM.recipe) { recipe in
                    
                    NavigationLink(destination: DetailsView(recipe: recipe, action: {                       recipeFavVM.saveSelectedHit(hit: recipe) }
                        ,tintColor: .brand, buttonLabel: "Add To Favorites")) {
                        
                        RecipeCell(recipe: recipe)
                    }
                    .swipeActions(edge: .leading, allowsFullSwipe: false) {
                        Button("", systemImage: "heart.fill") {
                            recipeFavVM.saveSelectedHit(hit: recipe)
                        }
                        .tint(.red)
                    }
                }
                
                .listStyle(.plain)
                .navigationTitle("MyRecipe")
                .searchable(text: $searchText, prompt: "Search Recipe")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Image(systemName: "fork.knife.circle")
                    }
                }
            }
            .autocorrectionDisabled()
            .keyboardType(.asciiCapable)
            .onChange(of: searchText, perform: { searchText in
                self.recipeVM.fetchData(category: self.searchText)
            })
            
            .task {
                recipeVM.showNoConnection = !networkMonitor.isConnected
                recipeVM.fetchData(category: searchText)
            }
            
            if recipeVM.isLoading {
                LoadingView()
            }
            
            if recipeVM.showNoConnection {
                NoConnection(showNoConnection: $recipeVM.showNoConnection)
            }
        }
        .onChange(of: networkMonitor.isConnected, perform: { isConnected in
            recipeVM.showNoConnection = !isConnected
            recipeVM.fetchData(category: searchText)
        })
        
//        .alert(AlertContext.serverError.text, isPresented: $recipeVM.showAlert) {
//            Button {
//                print("Alert dismissed")
//            } label: {
//                Text("OK")
//            }
//        }
//         message: {
//             AlertContext.serverError.message
//         }
         .alert(AlertContext.favError.text, isPresented: $recipeFavVM.showAlert) {
             Button {
                 print("Alert dismissed")
             } label: {
                 Text("OK")
             }
         }
     message: {
         AlertContext.favError.message
     }

    }
}



#Preview {
    RecipeView()
}
