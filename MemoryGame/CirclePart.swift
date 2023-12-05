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
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + radius * CGFloat(cos(angleStart.radians)),
            y: center.y + radius * CGFloat(sin(angleStart.radians))
        )
        
        var circlePath: Path = Path()
        
        circlePath.move(to: center)
        circlePath.addLine(to: start)
        circlePath.addArc(
            center: center, 
            radius: radius, 
            startAngle: angleStart, 
            endAngle: Angle(degrees: angleEnd.degrees-90),
            clockwise: false
        )
        circlePath.addLine(to: center)
        return circlePath
    }
}
