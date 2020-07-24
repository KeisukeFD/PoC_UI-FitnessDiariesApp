//
//  MealsCard.swift
//  UI-FitnessDiariesApp
//
//  Created by Valentin Malissen on 2020-07-23.
//

import SwiftUI


struct MealsCardView: View {
    var title: String
    var shortDescription: String
    var calories: Int
    
    var imageName: String
    
    var firstColor: Color
    var secondColor: Color
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [firstColor, secondColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .clipShape(RoundedCorners(radius: 10, corners: .topLeft))
                .clipShape(RoundedCorners(radius: 50, corners: .topRight))
                .clipShape(RoundedCorners(radius: 10, corners: .bottomLeft))
                .clipShape(RoundedCorners(radius: 10, corners: .bottomRight))
                .padding(.top, 30)
            

            GeometryReader { geo in
                Circle()
                    .fill(Color.white.opacity(0.1))
                    .frame(width: 100)
                    .offset(x: -15, y: -geo.size.height / 2 + 35)
                
                Image("\(imageName)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70)
                    .offset(x: 8, y: 4)
            }
            
            VStack(alignment: .leading) {
                Text("\(title)")
                    .font(.system(size: 18))
                    .bold()
                    .foregroundColor(.white)
                    .padding(.bottom)
                
                Text("\(shortDescription)")
                    .foregroundColor(.white)
                    .font(.system(size: 12))
                
                HStack(alignment: .bottom) {
                    Text("\(String(format: "%d", calories))")
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                        .alignmentGuide(.bottom) { dimension in
                            25
                        }
                    Text("kcal")
                        .foregroundColor(.white)
                        .font(.system(size: 12))
                }.padding(.top)
                
            }.offset(y: 30)

        }.frame(width: 120, height: 240)
    }
}

struct MealsCard_Previews: PreviewProvider {
    static var previews: some View {
        MealsCardView(title: "Breakfast", shortDescription: "Bread,\nPeanut butter,\nApple", calories: 525, imageName: "breakfast", firstColor: Color("orangeDark"), secondColor: Color("orangeLight"))
    }
}
