//
//  RecipeWebView.swift
//  MyRecipe
//
//  Created by Atakan Başaran on 30.11.2023.
//

import SwiftUI

struct RecipeWebView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

#Preview {
    RecipeWebView(url: "https://www.google.com.tr/?hl=tr")
}
