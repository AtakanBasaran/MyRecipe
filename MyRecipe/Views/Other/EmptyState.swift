//
//  EmptyState.swift
//  MyRecipe
//
//  Created by Atakan Başaran on 26.01.2024.
//

import SwiftUI

struct EmptyState: View {
    var body: some View {
        
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack {
                Image("order")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                
                Text("You have no recipe in your favorite list")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding()
            }
            .offset(y: -70)
        }
    }
}

#Preview {
    EmptyState()
}
