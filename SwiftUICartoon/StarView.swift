//
//  StarView.swift
//  SwiftUICartoon
//
//  Created by  BoDim on 17.02.2022.
//

import SwiftUI

struct StarView: View {
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            Image(systemName: "sparkles")
                .resizable()
                .foregroundColor(.blue)
                .frame(width: width, height: width * 1.2)
        }
    }
}

struct StarView_Previews: PreviewProvider {
    static var previews: some View {
        StarView()
            .frame(width: 100, height: 100)
    }
}
