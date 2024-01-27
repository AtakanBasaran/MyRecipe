//
//  ButtonStyle.swift
//  MyRecipe
//
//  Created by Atakan Başaran on 26.01.2024.
//

import SwiftUI

struct AddButtonStyle: ViewModifier {
    
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .controlSize(.regular)
    }
}
