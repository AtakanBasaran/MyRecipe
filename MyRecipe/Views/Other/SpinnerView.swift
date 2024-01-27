//
//  SpinnerView.swift
//  MyRecipe
//
//  Created by Atakan Başaran on 25.01.2024.
//

import SwiftUI

struct SpinnerView: View {
    var body: some View {
        
        ProgressView()
            .progressViewStyle(.circular)
            .scaleEffect(1.5, anchor: .center)
            .onAppear()
            .tint(Color(.brand))
    }
}

struct LoadingView: View {
    var body: some View {
        
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            SpinnerView()
        }
    }
}

#Preview {
    LoadingView()
}
