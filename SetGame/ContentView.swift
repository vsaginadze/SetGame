//
//  ContentView.swift
//  SetGame
//
//  Created by Vakhtang Saginadze on 04.03.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ZStack {
                let base = RoundedRectangle(cornerRadius: 12)
                
                let oval = RoundedRectangle(cornerRadius: 50)
                    .frame(width: 100, height: 300)
                    .padding()
                
                let rectangle = Rectangle()
                    .frame(width: 100, height: 150)
                                    .padding()
                                    
                Group {
                    base.fill(.white)
                    base.stroke(lineWidth: 2)
                    
                    VStack {
                        ForEach(0..<3, id: \.self) { idx in
                            Diamond()
                                .frame(width: 200, height: 150)
                                .padding()
                        }
                    }
                }
            }
        }
        .padding()
    }
    
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
}
#Preview {
    ContentView()
}
