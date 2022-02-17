//
//  MoonView.swift
//  SwiftUICartoon
//
//  Created by  BoDim on 17.02.2022.
//

import SwiftUI

struct MoonView: View {
    
    @Binding var showMoon: Bool
    
    let height = UIScreen.main.bounds.height
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            Image(systemName: "moon.fill")
                .resizable()
                .foregroundColor(.blue)
                .frame(width: width, height: width)
                .offset(
                    x: 0,
                    y: showMoon ? 0 : height)
                .animation(.easeOut(duration: 1.5))
            
        }
    }
}

struct MoonView_Previews: PreviewProvider {
    static var previews: some View {
        MoonView(showMoon: .constant(true))
            .frame(width: 100, height: 100)
    }
}
