//
//  NoConnection.swift
//  MyRecipe
//
//  Created by Atakan Başaran on 26.01.2024.
//

import SwiftUI

struct NoConnection: View {
    
    @Binding var showNoConnection: Bool
    
    var body: some View {
        
        ZStack {
            Color(.systemBackground)
            
            VStack {
                Image("noConnection")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 125, height: 125)
                
                Text("No connection.\nPlease check your network.")
                    .multilineTextAlignment(.center)
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundStyle(.secondary)
                    .padding()
            }
            .offset(y: -20)

            
        }
        .ignoresSafeArea()

    }
}

#Preview {
    NoConnection(showNoConnection: .constant(true))
}
