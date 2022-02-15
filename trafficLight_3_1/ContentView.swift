//
//  ContentView.swift
//  trafficLight_3_1
//
//  Created by Михаил Куприянов on 15.02.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            VStack {
                Circle()
                    .foregroundColor(.red)
                    .frame(width: 150, height: 150)
                    .overlay(Circle().stroke(Color.white, lineWidth: 5))
                Text("Hello, world!")
                    .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
