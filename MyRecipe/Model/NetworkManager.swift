//
//  NetworkManager.swift
//  MyRecipe
//
//  Created by Atakan Başaran on 29.11.2023.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var recipes = [Hit]()
    
    func fetchData(category: String) {
        
        if let url = URL(string: "https://api.edamam.com/api/recipes/v2?type=public&q=\(category)&app_id=b5fcaeef&app_key=3931ee10f5ad501b84307226ec23edbd%09&diet=balanced&mealType=Dinner") {
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print(error.localizedDescription)
                } else if let data = data {
                    do {
                        let decodedData = try JSONDecoder().decode(Results.self, from: data)
                        DispatchQueue.main.async { //Updating in UI
                            self.recipes = decodedData.hits
                        }                        
                        
                    } catch {
                        print("parse error: \(error)")
                    }
                }
            }.resume()
        }
    }
    
    
}
