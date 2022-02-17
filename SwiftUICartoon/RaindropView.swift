//
//  RaindropView.swift
//  SwiftUICartoon
//
//  Created by  BoDim on 17.02.2022.
//

import SwiftUI

struct RaindropView: View {
    
    @Binding var showRain: Bool
    
    let height = UIScreen.main.bounds.height
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            Raindrop()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [.white, .blue]),
                        startPoint: .topLeading, endPoint: .bottom)
                )
            .frame(width: width, height: width)
            .offset(
                x: 20,
                y: showRain ? height : 0)
            .animation(.easeOut(duration: 3))
        }
    }
}

struct RaindropView_Previews: PreviewProvider {
    static var previews: some View {
        RaindropView(showRain: .constant(true))
            .frame(width: 50, height: 50)
    }
}


struct Raindrop: Shape {
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.size.width/2, y: 0))
            path.addQuadCurve(
                to: CGPoint(x: rect.size.width/2, y: rect.size.height),
                control: CGPoint(x: rect.size.width, y: rect.size.height)
            )
            path.addQuadCurve(
                to: CGPoint(x: rect.size.width/2, y: 0),
                control: CGPoint(x: 0, y: rect.size.height)
            )
        }
    }
}
