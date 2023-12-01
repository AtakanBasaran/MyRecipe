//
//  RecipeModel.swift
//  MyRecipe
//
//  Created by Atakan Başaran on 29.11.2023.
//

import Foundation

struct Results: Decodable {
    let hits: [Hit]
}

struct Hit: Decodable, Identifiable {
    let recipe: Recipe
    var id: String {
        return recipe.label
    }
}

struct Recipe: Decodable {
    let label: String
    let image: String
    let url: String
    let ingredientLines: [String]
    let calories: Double
    let totalTime: Int
}





