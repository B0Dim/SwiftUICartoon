//
//  SunView.swift
//  SwiftUICartoon
//
//  Created by  BoDim on 17.02.2022.
//

import SwiftUI

struct SunView: View {
    
    @Binding var showSun: Bool
    
    let height = UIScreen.main.bounds.height
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            Image(systemName: "sun.max.fill")
                .resizable()
                .foregroundColor(.yellow)
                .frame(width: width, height: width)
                .offset(
                    x: showSun ? 100 : 0,
                    y: showSun ? 0 : height)
                .animation(.easeOut(duration: 1.5))
            
        }
            
    }
}

struct TimeOfDayView_Previews: PreviewProvider {
    static var previews: some View {
        SunView(showSun: .constant(false))
            .frame(width: 100, height: 100)
    }
}
