//
//  ContentView.swift
//  trafficLight_3_1
//
//  Created by Михаил Куприянов on 15.02.2022.
//

import SwiftUI

enum CurrentLight {
    case red, yellow, green
}

struct ContentView: View {
    @State private var buttonText = "start"
    @State private var redColorCircle = ColorCircle(color: .red, saturation: 0.1)
    //запутался почему не могу использовать так -> color: .red,saturation: lightIsOn
    @State private var yellowColorCircle = ColorCircle(color: .yellow, saturation: 0.1)
    @State private var greenColor = ColorCircle(color: .green, saturation: 0.1)
    
    @State private var currentLight = CurrentLight.red
    private var lightIsOn: Double = 1.0
    private var lightIsOff: Double = 0.1
    
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            VStack {
                redColorCircle
                yellowColorCircle
                greenColor
                Spacer()
                buttom
            }
            .padding()
        }
    }
    
    private var buttom: some View {
        Button(action: {
            buttonText = "next"
            trafficLightSwitch()
        }){
            Text(buttonText)
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
                .padding()
                .frame(width: 150, alignment: .center)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white, lineWidth: 5)
                )
                .background(Color.blue)
                .cornerRadius(20)
                .textCase(.uppercase)
        }
    }
    
    private func trafficLightSwitch() {
        switch currentLight {
        case .red:
            redColorCircle.saturation = lightIsOn
            yellowColorCircle.saturation = lightIsOff
            greenColor.saturation = lightIsOff
            currentLight = .yellow
        case .yellow:
            redColorCircle.saturation = lightIsOff
            yellowColorCircle.saturation = lightIsOn
            greenColor.saturation = lightIsOff
            currentLight = .green
        case .green:
            redColorCircle.saturation = lightIsOff
            yellowColorCircle.saturation = lightIsOff
            greenColor.saturation = lightIsOn
            currentLight = .red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
