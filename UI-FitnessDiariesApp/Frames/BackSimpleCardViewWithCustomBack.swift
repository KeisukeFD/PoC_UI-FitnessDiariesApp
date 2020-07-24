//
//  BackCardView.swift
//  UI-FitnessDiariesApp
//
//  Created by Valentin Malissen on 2020-07-23.
//

import SwiftUI


struct BackSimpleCardViewWithCustomBack<Content>: View where Content: View {
    var content: Content
    
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Rectangle()
                .fill(Color.white)
                .clipShape(RoundedCorners(radius: 10, corners: .allCorners))
                .shadow(color: Color("backColorShadow"), radius: 15)

            self.content
        }
    }
}


struct BackSimpleCardViewWithCustomBack_Previews: PreviewProvider {
    static var previews: some View {
        BackSimpleCardViewWithCustomBack {

        }
    }
}
