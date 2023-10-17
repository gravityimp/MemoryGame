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
    
    var body: some View {
        Button(action: {}) {
            VStack {
                Text(icon)
                Text("Motyw "+String(number))
            }
        }
    }
}

#Preview {
    StyleButton(icon: .constant(""), number: .constant(1))
}
