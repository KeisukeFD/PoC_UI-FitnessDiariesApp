//
//  BackCardView.swift
//  UI-FitnessDiariesApp
//
//  Created by Valentin Malissen on 2020-07-23.
//

import SwiftUI


struct BackCardView<Content>: View where Content: View {
    var backgroundColors: [Color]
    var content: Content
    
    
    init(backgroundColors: [Color] = [.white], @ViewBuilder content: () -> Content) {
        self.backgroundColors = backgroundColors
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            if self.backgroundColors.count == 1 {
                VStack(alignment: .leading) {
                    self.content
                }.background(backgroundColors[0])
            } else {
                VStack(alignment: .leading) {
                    self.content
                }.background(LinearGradient(gradient: Gradient(colors: backgroundColors), startPoint: .topLeading, endPoint: .bottomTrailing))
            }
        }
        .clipShape(RoundedCorners(radius: 60, corners: .topRight))
        .clipShape(RoundedCorners(radius: 10, corners: .topLeft))
        .clipShape(RoundedCorners(radius: 10, corners: .bottomLeft))
        .clipShape(RoundedCorners(radius: 10, corners: .bottomRight))
        .shadow(color: Color("backColorShadow"), radius: 15)
    }
}


struct BackCardView_Previews: PreviewProvider {
    static var previews: some View {
        BackCardView {
            Text("Blah")
        }
    }
}
