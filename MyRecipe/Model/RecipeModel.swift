//
//  RecipeModel.swift
//  MyRecipe
//
//  Created by Atakan Başaran on 29.11.2023.
//

import Foundation
import SwiftData

struct Results: Codable {
    let hits: [Hit]
}


struct Hit: Codable, Identifiable {
    let recipe: Recipe
    var id: String {
        return recipe.label
    }
}

struct Recipe: Codable {
    let label: String
    let image: String
    let url: String
    let ingredientLines: [String]
    let calories: Double
    let totalTime: Int
}


struct ExData {
    
    static let exRecipe = Recipe(label: "Vietnamese Coffee Ice Cream recipes Vietnamese Coffee Ice Cream recipes", image: "", url: "", ingredientLines: ["2 rice bananas, 16 oz maple yogurt, 1 tsp vanilla"], calories: 495, totalTime: 5)
    
    static let sampleRecipe = Hit(recipe: exRecipe)
}





