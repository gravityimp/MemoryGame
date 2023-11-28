//
//  CirclePart.swift
//  MemoryGame
//
//  Created by student on 28/11/2023.
//

import Foundation
import SwiftUI
import CoreGraphics

struct CirclePart: Shape {
    
    let angleStart: Angle = Angle(degrees: -90)
    let angleEnd: Angle
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let radius = min(rect.width / 2, rect.height / 2)
        var circlePath: Path = Path()
        
        circlePath.move(to: center)
        circlePath.addArc(center: center, radius: radius, startAngle: angleStart, endAngle: angleEnd, clockwise: false)
        circlePath.closeSubpath()
        return circlePath
    }
}

#Preview {
    CirclePart(angleEnd: Angle(degrees: 180.0))
}
