//
//  BackCardView.swift
//  UI-FitnessDiariesApp
//
//  Created by Valentin Malissen on 2020-07-23.
//

import SwiftUI


struct BackSimpleCardView<Content>: View where Content: View {
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
        .cornerRadius(10)
        .shadow(color: Color("backColorShadow"), radius: 15)
    }
}


struct BackSimpleCardView_Previews: PreviewProvider {
    static var previews: some View {
        BackSimpleCardView {
            VStack {
                HStack { Spacer() }
                Text("Blah")
            }
        }.padding()
    }
}
