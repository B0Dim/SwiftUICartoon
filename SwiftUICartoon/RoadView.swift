//
//  RoadView.swift
//  SwiftUICartoon
//
//  Created by  BoDim on 17.02.2022.
//

import SwiftUI

struct RoadView: View {
    
    @Binding var goByke: Bool
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var body: some View {
        ZStack {
            Path { path in
                path.move(to: CGPoint(x: 0, y: height * 0.65))
                path.addLine(to: CGPoint(x: 0, y: height * 0.82))
                path.addLine(to: CGPoint(x: width, y: height * 0.82))
                path.addLine(to: CGPoint(x: width, y: height * 0.65))
            }
            .fill(Color(red: 0.4, green: 0.4, blue: 0.4))
            
            Path { path in
                path.move(to: CGPoint(x: 0, y: height * 0.735))
                path.addLine(to: CGPoint(x: width, y: height * 0.735))
            }
            .stroke(
                Color.white,
                style: StrokeStyle(
                    lineWidth: 3,
                    dash: [width / 7]
                )
            )
            
            
            Image(systemName: "bicycle")
                .resizable()
                .foregroundColor(.red)
                .frame(width: 80, height: 80)
                .scaledToFill()
                .offset(
                    x: goByke ? width + 80 : -width * 0.5,
                    y: height * 0.50
                )
                .animation(.easeInOut(duration: 30))
                
        }    
    }
}

struct RoadView_Previews: PreviewProvider {
    static var previews: some View {
        RoadView(goByke: .constant(true))
            .frame(width: UIScreen.main.bounds.width, height: 500)
    }
}
