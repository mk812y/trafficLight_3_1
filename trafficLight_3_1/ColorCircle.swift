//
//  ColorCircle.swift
//  trafficLight_3_1
//
//  Created by Михаил Куприянов on 15.02.2022.
//

import SwiftUI

struct ColorCircle: View {
    let color: Color
    
    var body: some View {
        Circle()
            .foregroundColor(color)
            .frame(width: 150, height: 150)
            .overlay(Circle().stroke(Color.white, lineWidth: 5))
            .padding(.bottom)
            .brightness(/*@START_MENU_TOKEN@*/0.60/*@END_MENU_TOKEN@*/)
    }
}

struct ColorCircle_Previews: PreviewProvider {
    static var previews: some View {
        ColorCircle(color: .red)
    }
}
