//
//  ContentView.swift
//  SwiftUICartoon
//
//  Created by  BoDim on 17.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showSun = false
    @State private var showMoon = false
    @State private var showStar = false
    @State private var showCloud = false
    @State private var goByke = false
    @State private var hideSun = false
    @State private var showRain = false
    @State private var isHidden = false
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var body: some View {
        VStack {
            ZStack {
                ZStack {
                    RoadView(goByke: $goByke)
                        .frame(width: width, height: 200)
                    SunView(showSun: $showSun)
                        .frame(width: width * 0.3, height: width * 0.3)
                        .opacity(hideSun ? 0 : 1)
                    AirplaneView(
                        showSun: $showSun,
                        screenWidth: width * 2
                    )
                        .frame(width: width * 0.2, height: width * 0.2)
                        .offset(x: -width, y: 0)
                    
                    HStack {
                        ZStack {
                            CloudView(showCloud: $showCloud)
                                .frame(width: width * 0.3, height: width * 0.3)
                                .opacity(showCloud ? 1 : 0)
                            RaindropView(showRain: $showRain)
                                .frame(width: width / 10, height: width / 10)
                                .opacity(showRain ? 1 : 0)
                            
                                
                            StarView()
                                .frame(width: width * 0.3, height: width * 0.3)
                                .opacity(showStar ? 1 : 0)
                            .padding()
                        }
                        Spacer()
                        MoonView(showMoon: $showMoon)
                            .frame(width: width * 0.3, height: width * 0.3)
                            .padding()
                    }
                }

            }
            Spacer()
            ButtonView(title: "Start") {
                isHidden.toggle()
                goByke.toggle()
                showAnimate()
            }
            .opacity(isHidden ? 0 : 1)
        }
    }
    
    private func removeAll() {

    }
    
    private func showAnimate() {
            withAnimation {
                showSun.toggle()
                delay(3) {
                    showSun.toggle()
                }
                delay(5) {
                    showMoon.toggle()
                }
            }
            delay(5) {
                withAnimation(.easeInOut(duration: 4)) {
                    showStar.toggle()
                }
                delay(6) {
                    withAnimation(.easeInOut(duration: 3)) {
                        showStar.toggle()
                        showMoon.toggle()
                        showSun.toggle()
                        showCloud.toggle()
                        delay(2) {
                            withAnimation(.easeInOut(duration: 2)) {
                                hideSun.toggle()
                            }
                            showRain.toggle()
                        }
                    }
                }
        }

    }
    
    private func delay(_ seconds: Double, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct ButtonView: View {
    let title: String
    let tapButton: () -> Void
    
    var body: some View {
        Button(action: tapButton) {
            Text(title)
                .font(.title)
                .foregroundColor(.white)
                
        }
        .frame(width: 155, height: 55)
        .background(.blue)
        .cornerRadius(15)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
            .stroke(Color.white, lineWidth: 4)
        )
    }
        
    
}
