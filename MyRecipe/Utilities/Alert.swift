//
//  Alert.swift
//  MyRecipe
//
//  Created by Atakan Başaran on 25.01.2024.
//

import SwiftUI

struct AlertItem: Identifiable {
    
    let id = UUID()
    let text: Text
    let message: Text
    let dismissButton: Alert.Button
}


struct AlertContext {
    
    static let serverError = AlertItem(text: Text("Server Error!"), message: Text("The response from server is invalid. Please try again. If the problem persist, please contact support"), dismissButton: .default(Text("OK")))
    static let favError = AlertItem(text: Text("Error Adding to Favorites!"), message: Text("The recipe is already in your favorites."), dismissButton: .default(Text("OK")))
    static let removeError = AlertItem(text: Text("Error Removing From Favorites!"), message: Text("You already deleted this recipe from your favorites."), dismissButton: .default(Text("OK")))



}
