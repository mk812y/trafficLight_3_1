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
    @State private var redColorCircle = ColorCircle(color: .red, opacity: 0.1)
    //запутался почему не могу использовать так -> color: .red,saturation: lightIsOn
    @State private var yellowColorCircle = ColorCircle(color: .yellow, opacity: 0.1)
    //не понял как добраться до ColorCircle кроме как -> @State private var greenColor = ColorCircle(co
    @State private var greenColor = ColorCircle(color: .green, opacity: 0.1)
    
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
            redColorCircle.opacity = lightIsOn
            yellowColorCircle.opacity = lightIsOff
            greenColor.opacity = lightIsOff
            currentLight = .yellow
        case .yellow:
            redColorCircle.opacity = lightIsOff
            yellowColorCircle.opacity = lightIsOn
            greenColor.opacity = lightIsOff
            currentLight = .green
        case .green:
            redColorCircle.opacity = lightIsOff
            yellowColorCircle.opacity = lightIsOff
            greenColor.opacity = lightIsOn
            currentLight = .red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
