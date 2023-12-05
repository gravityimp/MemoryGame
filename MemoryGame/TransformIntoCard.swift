//
//  TransformIntoCard.swift
//  MemoryGame
//
//  Created by student on 05/12/2023.
//

import Foundation
import SwiftUI

struct TransformIntoCard: ViewModifier {
    var isFlipped: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFlipped {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                content
            } else {
                base.fill().opacity(isFlipped ? 0 : 1)
            }
        }.rotation3DEffect(
            Angle(degrees: isFlipped ? 0 : 180),
            axis: (x: 0, y: 1, z: 0)
        ).animation(Animation.linear(duration: 2))
    }
}

extension View {
    func transformIntoCard(isFlipped: Bool) -> some View {
        self.modifier(TransformIntoCard(isFlipped: isFlipped))
    }
}
