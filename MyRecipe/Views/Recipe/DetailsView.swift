//
//  DetailsView.swift
//  MyRecipe
//
//  Created by Atakan Başaran on 29.11.2023.
//

import SwiftUI

struct DetailsView: View {
    
    @StateObject var recipeFavVM = RecipeFavViewModel()
    
    let recipe: Hit
    var action: () -> Void
    var tintColor: Color
    var buttonLabel: String
    
    
    var body: some View {
        
        NavigationStack {
            
            VStack(spacing: 15){
                
                AsyncImage(url: URL(string: recipe.recipe.image)) { image in //we get SwiftUI Image from this function
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .clipShape(.rect(cornerRadius: 15))
                    
                } placeholder: {
                    Image("placeholder")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .clipShape(.rect(cornerRadius: 15))
                }
                .offset(y: -15)
                
                VStack(spacing: 15) {
                    Text(recipe.recipe.label)
                        .font(.system(size: 19))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.leading, 5)
                        .padding(.trailing, 5)

                    
                    HStack(alignment: .center, spacing: 15) {
                        HStack {
                            Image(systemName: "fork.knife")
                            
                            Text("\(String(format: "%.0f", recipe.recipe.calories)) Cal")
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
                        }
                        HStack {
                            Image(systemName: "clock")
                            
                            Text("\(recipe.recipe.totalTime) min")
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
                        }
                    }
                    
                    Button(action: action) {
                        Text(buttonLabel)
                    }
                    .tint(tintColor)
                    .modifier(AddButtonStyle())
                    .padding(.top, 5)
                }
                
                List {
                    Section {
                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(recipe.recipe.ingredientLines, id: \.self) { ingredient in
                                Text("• \(ingredient)")
                                    .font(.system(size: 16))
                            }
                        }
                    } header: {
                        Text("Ingredients")
                            .font(.system(size: 16))
                    }
                }
                
            }
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: RecipeWebView(url: recipe.recipe.url)) {
                        Text("WebPage")
                    }
                }
            }
            
            
        }
    }
}


#Preview {
    DetailsView(recipe: ExData.sampleRecipe, action: {print("tapped")}, tintColor: Color(.brand), buttonLabel: "delete")
}
