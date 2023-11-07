//
//  StyleButton.swift
//  MemoryGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct StyleButton: View {
    
    @Binding var icon: String
    @Binding var number: Int
    @Binding var color: Color
    @Binding var theme: Color
    
    var body: some View {
        Button(action: {
            theme = color
        }) {
            VStack {
                Text(icon)
                Text("Motyw "+String(number))
            }
        }.disabled(theme == color)
    }
}

#Preview {
    StyleButton(icon: .constant(""), number: .constant(1), color: .constant(Color.blue), theme: .constant(Color.blue))
}
