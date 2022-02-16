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
   
    @State private var redLightState = 0.1
    @State private var yellowLightState = 0.1
    @State private var greenLightState = 0.1
    
    @State private var currentLight = CurrentLight.red
    
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            VStack {
                ColorCircle(color: .red, opacity: redLightState)
                ColorCircle(color: .yellow, opacity: yellowLightState)
                ColorCircle(color: .green, opacity: greenLightState)
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
        let lightIsOn: Double = 1.0
        let lightIsOff: Double = 0.1

        
        switch currentLight {
        case .red:
            redLightState = lightIsOn
            yellowLightState = lightIsOff
            greenLightState = lightIsOff
            currentLight = .yellow
        case .yellow:
            redLightState = lightIsOff
            yellowLightState = lightIsOn
            greenLightState = lightIsOff
            currentLight = .green
        case .green:
            redLightState = lightIsOff
            yellowLightState = lightIsOff
            greenLightState = lightIsOn
            currentLight = .red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
