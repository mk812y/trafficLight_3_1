//
//  ContentView.swift
//  trafficLight_3_1
//
//  Created by Михаил Куприянов on 15.02.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var buttonText = "start"
    
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            VStack {
                ColorCircle(color: .red)
                ColorCircle(color: .yellow)
                ColorCircle(color: .blue)
                Spacer()
                buttom
            }
            .padding()
        }
    }
    
    private var buttom: some View {
        Button(action: { buttonText = "next" }){
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
