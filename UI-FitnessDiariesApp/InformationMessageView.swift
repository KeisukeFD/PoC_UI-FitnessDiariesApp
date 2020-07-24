//
//  InformationMessageView.swift
//  UI-FitnessDiariesApp
//
//  Created by Valentin Malissen on 2020-07-23.
//

import SwiftUI


struct InformationMessageView: View {
    var message: String
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Text("\(message)")
                .font(.system(size: 14))
                .lineLimit(3)
                .padding()
                .padding(.leading, 60)
                .background(Color("endBlueGradient").opacity(0.4))
                .cornerRadius(15)
                .foregroundColor(Color.accentColor)

            Image("glass")
                .resizable()
                .scaledToFit()
                .frame(width: 90)
                .offset(y: -30)
        }
    }
}


struct InformationMessageView_Previews: PreviewProvider {
    static var previews: some View {
        InformationMessageView(message: "Prepare your stomach for lunch with one or two flass of water")
    }
}
