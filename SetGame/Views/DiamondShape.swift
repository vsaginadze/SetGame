//
//  DiamondShape.swift
//  SetGame
//
//  Created by Vakhtang Saginadze on 08.03.2024.
//

import SwiftUI

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        
        let centerX = rect.midX
        let centerY = rect.midY
        
        var path = Path()
        
        // Move to the top point
        path.move(to: CGPoint(x: centerX, y: 0))
        
        // Draw the top-right line
        path.addLine(to: CGPoint(x: width, y: centerY))
        
        path.addLine(to: CGPoint(x: centerX, y: height))
        
        path.addLine(to: CGPoint(x: 0, y: centerY))
        
        path.closeSubpath()
        
        return path
    }
}
