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
                
                Group {
                    base.fill(.white)
                    base.stroke(lineWidth: 2)
                    
                    Text("shape")
                        .font(.system(size: 200))
                        .minimumScaleFactor(0.01)
                        .aspectRatio(contentMode: .fit)
                                            
                }
            }
        }
        .padding()
    }
}
#Preview {
    ContentView()
}
