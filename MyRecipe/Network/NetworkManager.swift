//
//  NetworkManager.swift
//  MyRecipe
//
//  Created by Atakan Başaran on 29.11.2023.
//

import Foundation

enum ServiceError: Error {
    case parseError
    case serverError
    case invalidURL
    case invalidResponse
}

//class NetworkManager: ObservableObject {
//    
//    @Published var recipes = [Hit]()
//    
//    func fetchData(category: String) {
//        
//        if let url = URL(string: "https://api.edamam.com/api/recipes/v2?type=public&q=\(category)&app_id=b5fcaeef&app_key=3931ee10f5ad501b84307226ec23edbd%09&diet=balanced&mealType=Dinner") {
//            
//            URLSession.shared.dataTask(with: url) { data, response, error in
//                if let error = error {
//                    print(error.localizedDescription)
//                } else if let data = data {
//                    do {
//                        let decodedData = try JSONDecoder().decode(Results.self, from: data)
//                        DispatchQueue.main.async { //Updating in UI
//                            self.recipes = decodedData.hits
//                        }                        
//                        
//                    } catch {
//                        print("parse error: \(error)")
//                    }
//                }
//            }.resume()
//        }
//    }
//    
//
//}


final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}

    
    func downloadRecipe(urlString: String) async throws -> [Hit] {
        
        guard let url = URL(string: urlString) else {
            throw ServiceError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw ServiceError.invalidResponse
        }
        
        if data.isEmpty {
            throw ServiceError.serverError
        }
        
        do {
            let decodedData = try JSONDecoder().decode(Results.self, from: data)
            return decodedData.hits
            
        } catch {
            throw ServiceError.parseError
        }
    }
}
