//
//  RecipeFavViewModel.swift
//  MyRecipe
//
//  Created by Atakan Başaran on 25.01.2024.
//

import Foundation

class RecipeFavViewModel: ObservableObject {
    
    @Published var savedHits: [Hit] = []
    @Published var showAlert = false
    @Published var showRemoveAlert = false
    @Published var selectedRecipe: Hit?
    @Published var isShowingDetail = false


    private let key = "selectedHits"
    

    func saveSelectedHit(hit: Hit) {
        var selectedHits = getSelectedHits()
        
        if !selectedHits.contains(where: {$0.id == hit.id}) {
            selectedHits.append(hit)
            saveHitsToUserDefaults(hits: selectedHits)
            savedHits = selectedHits
            showAlert = false
        } else {
            showAlert = true
            print("already saved")
        }
    }
    
    func deleteRecipe(hit: Hit) {
        
        var selectedHits = getSelectedHits()

        if !selectedHits.contains(where: {$0.id == hit.id}) {
            showRemoveAlert = true
        } else {
            showAlert = false
        }
        
        selectedHits = selectedHits.filter {$0.id != hit.id}
        saveHitsToUserDefaults(hits: selectedHits)
        savedHits = selectedHits
        
        
    }

    func getSelectedHits() -> [Hit] {
        retrieveHitsFromUserDefaults()
    }

    private func saveHitsToUserDefaults(hits: [Hit]) {
        do {
            let data = try JSONEncoder().encode(hits)
            UserDefaults.standard.set(data, forKey: key)
            print("Hits saved successfully")

        } catch {
            print("Error encoding hits: \(error)")
        }
    }

    private func retrieveHitsFromUserDefaults() -> [Hit] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            print("No data found in UserDefaults")
            return []
        }

        do {
            let hits = try JSONDecoder().decode([Hit].self, from: data)
            self.savedHits = hits
            print("Hits retrieved successfully")
            return hits
        } catch {
            print("Error decoding hits: \(error)")
            return []
        }
    }
}

