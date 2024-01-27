//
//  RecipeCell.swift
//  MyRecipe
//
//  Created by Atakan Başaran on 25.01.2024.
//

import SwiftUI

struct RecipeCell: View {
    
    let recipe: Hit
    
    var body: some View {
        
            HStack {
                AsyncImage(url: URL(string: recipe.recipe.image)) { image in //we get SwiftUI Image from this function
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .clipShape(.rect(cornerRadius: 15))

                } placeholder: {
                    Image("placeholder")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 90)
                        .clipShape(.rect(cornerRadius: 15))
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text(recipe.recipe.label)
                        .multilineTextAlignment(.leading)
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    HStack(alignment: .center, spacing: 15) {
                        HStack {
                            Image(systemName: "fork.knife")
                                .foregroundStyle(.secondary)
                            
                            Text("\(String(format: "%.0f", recipe.recipe.calories)) Cal")
                                .font(.system(size: 16))
                                .foregroundStyle(.secondary)
                        }
                        HStack {
                            Image(systemName: "clock")
                                .foregroundStyle(.secondary)

                            Text("\(recipe.recipe.totalTime) min")
                                .font(.system(size: 16))
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                .padding(.leading)
            }
    }
}

#Preview {
    RecipeCell(recipe: ExData.sampleRecipe)
}
