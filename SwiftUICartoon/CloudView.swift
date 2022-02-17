//
//  CloudView.swift
//  SwiftUICartoon
//
//  Created by  BoDim on 17.02.2022.
//

import SwiftUI

struct CloudView: View {
    
    @Binding var showCloud: Bool
    
    let height = UIScreen.main.bounds.height
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            Image(systemName: "cloud.rain")
                .resizable()
                .foregroundColor(.blue)
                .frame(width: width, height: width)
                .offset(
                    x: showCloud ? width / 2 : -width,
                    y: 0
                )
                .animation(.easeOut(duration: 3.5))
            
        }
            
    }
}

struct CloudView_Previews: PreviewProvider {
    static var previews: some View {
        CloudView(showCloud: .constant(false))
            .frame(width: 100, height: 100)
    }
}
