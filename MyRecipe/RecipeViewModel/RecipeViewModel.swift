//
//  RecipeViewModel.swift
//  MyRecipe
//
//  Created by Atakan Başaran on 25.01.2024.
//

import SwiftUI
import Observation


@MainActor class RecipeViewModel: ObservableObject {
    
    @Published var recipe: [Hit] = []
    @Published var isLoading: Bool = false
    @Published var showAlert = false
    @Published var showNoConnection = false

    
    func fetchData(category: String) {
        isLoading = true
        
        Task {
            do {
                recipe = try await NetworkManager.shared.downloadRecipe(urlString:         "https://api.edamam.com/api/recipes/v2?type=public&q=\(category)&app_id=b5fcaeef&app_key=3931ee10f5ad501b84307226ec23edbd%09&diet=balanced&mealType=Dinner")
                isLoading = false
                showAlert = false
                
            } catch {
                showAlert = true
                if let serviceError = error as? ServiceError {
                    
                    switch serviceError {
                        
                    case .invalidResponse:
                        print("Invalid Response")
                        
                    case .parseError:
                        print("Parse Error")

                    case .serverError:
                        print("Server Error")

                    case .invalidURL:
                        print("Invalid URL")
                    }
                }
                isLoading = false
            }
        }
    }
    
}
