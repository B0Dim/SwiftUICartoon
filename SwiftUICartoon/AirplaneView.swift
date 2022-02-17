//
//  AirplaneView.swift
//  SwiftUICartoon
//
//  Created by  BoDim on 17.02.2022.
//

import SwiftUI

struct AirplaneView: View {
    
    @Binding var showSun: Bool
    
    let screenWidth: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            Image(systemName: "airplane")
                .resizable()
                .frame(width: width, height: width)
                .foregroundColor(.green)
                .opacity(0.7)
                .offset(
                    x: showSun ? screenWidth + width : 0,
                    y: 100)
                .animation(.easeIn(duration: 4))
                .rotationEffect(
                    .degrees(showSun ? 0 : 180)
                )

        }

    }
}

struct AirplaneView_Previews: PreviewProvider {
    static var previews: some View {
        AirplaneView(showSun: .constant(true), screenWidth: 500)
            .frame(width: 100, height: 100)
    }
}
