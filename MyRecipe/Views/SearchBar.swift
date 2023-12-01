//
//  SearchBar.swift
//  MyRecipe
//
//  Created by Atakan Başaran on 1.12.2023.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String //bind to textfield
    var onSearch: () -> Void

    var body: some View {
        HStack {
            TextField("Search Recipe", text: $text, onCommit: onSearch)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: {
                onSearch()
            }) {
                Image(systemName: "magnifyingglass")
            }
        }
        .padding()
    }
}


