//
//  DetailsView.swift
//  MyRecipe
//
//  Created by Atakan Başaran on 29.11.2023.
//

import SwiftUI

struct DetailsView: View {
   
    let imageUrl: String
    let label: String
    let ingredientLines: [String]
    let calories: Double
    let totalTime: Int
    let url: String
    

    var body: some View {
        
        NavigationStack {
            
        VStack(spacing: 30){
            
            AsyncImage(url: URL(string: imageUrl)) { phase in
                switch phase {
                case .empty:
                    Text("Loading...")
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 260, height: 260)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                case .failure:
                    Text("Failed to load image")
                @unknown default:
                    Text("Unknown state")
                }
            }
                
            VStack(spacing: 15) {
                Text(label)
                    .font(.system(size: 19))
                    .fontWeight(.bold)
                HStack(alignment: .center, spacing: 15) {
                    HStack {
                        Image(systemName: "fork.knife")
                        Text("\(String(format: "%.0f", calories)) Cal")
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                    }
                    HStack {
                        Image(systemName: "clock")
                        Text("\(totalTime) min")
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                    }
                }
            }
        }
        
        List {
            Section {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(ingredientLines, id: \.self) { ingredient in
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
                NavigationLink(destination: RecipeWebView(url: self.url)) {
                    Text("WebPage")
                }
            }
        }
            
        
    }
}

#Preview {
    DetailsView(imageUrl: "https://cdn.yemek.com/mncrop/940/625/uploads/2022/07/mois-pasta-tarifi-yemekcom.jpg", label: "Chicken", ingredientLines: ["1 pack instant ramen noodles", "600ml chicken stock","½ cooked chicken breast , sliced", "4 tbsp sweetcorn , peas or chopped beans", "1 egg", "sesame oil , to serve (optional)"], calories: 50, totalTime: 15, url: "https://www.bbcgoodfood.com/recipes/chicken-sweetcorn-ramen")
}
