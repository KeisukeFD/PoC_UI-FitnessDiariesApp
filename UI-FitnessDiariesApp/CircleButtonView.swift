//
//  CircleButton.swift
//  UI-FitnessDiariesApp
//
//  Created by Valentin Malissen on 2020-07-23.
//

import SwiftUI


struct CircleButtonView: View {
    var image: String
    var action: () -> Void
    
    var backgroundColors: [Color] = [Color("nearlyDarkBlue"), Color("endBlueGradient")]
    var foregroundColor: Color = .white
    
    var shadowColor: Color = Color("nearlyDarkBlue")
    
    var body: some View {
        Button(action: action, label: {
            ZStack {
                if backgroundColors.count == 1 {
                    Circle()
                        .fill(backgroundColors[0])
                        .frame(width: 60)
                        .shadow(color: shadowColor.opacity(0.4), radius: 16, x: 8, y: 16)

                } else {
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: backgroundColors), startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                        .frame(width: 60)
                        .shadow(color: shadowColor.opacity(0.4), radius: 16, x: 8, y: 16)
                }

                Image(systemName: "\(self.image)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
                    .foregroundColor(foregroundColor)
            }
        })
    }
}


struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonView(image: "plus", action: {})
    }
}
