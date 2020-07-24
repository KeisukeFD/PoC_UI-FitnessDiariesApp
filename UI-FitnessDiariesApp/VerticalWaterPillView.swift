//
//  VerticalWaterPill.swift
//  UI-FitnessDiariesApp
//
//  Created by Valentin Malissen on 2020-07-23.
//

import SwiftUI


struct VerticalWaterPillView: View {
    @State var progress = 0.6
    
    private func changeProgress(step: Double = 0.1) {
        var tmp = self.progress
        tmp += step
        if tmp >= 1.0 {
            self.progress = 1.0
        }
        else if tmp <= 0.0 {
            self.progress = 0.0
        } else {
            self.progress += step
        }
    }
    
    var body: some View {
        HStack {
            VStack {
                CircleButtonView(image: "plus", action: {
                    withAnimation {
                        changeProgress(step: 0.1)
                    }
                }, backgroundColors: [.white], foregroundColor: Color("nearlyDarkBlue"))
                .scaleEffect(0.8, anchor: .center)
                
                CircleButtonView(image: "minus", action: {
                    withAnimation {
                        changeProgress(step: -0.1)
                    }
                }, backgroundColors: [.white], foregroundColor: Color("nearlyDarkBlue"))
                .scaleEffect(0.8, anchor: .center)
            }
            .padding(.trailing)
            
            ZStack {
                GeometryReader { geo in
                    Rectangle()
                        .fill(Color("backPillColor"))
                        .mask(Capsule())
                    
                    Circle()
                        .trim(from: 0.0, to: 0.15)
                        .stroke(style: StrokeStyle(lineWidth: 16, lineCap: .round, lineJoin: .round))
                        .rotation(.degrees(300), anchor: .center)
                        .fill(Color.white)
                        .frame(width: 200)
                        .blur(radius: 2)
                        .offset(x: geo.size.width / 6, y: -geo.size.height / 4)

                    let percentHeight: Double = (progress * Double(geo.size.height))
                    
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color("nearlyDarkBlue").opacity(0.4), Color("nearlyDarkBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .offset(y: geo.size.height - CGFloat(percentHeight))
                        .mask(Capsule())

                    HStack(spacing: 2) {
                        Text("\(String(format: "%d", Int(progress*100)))")
                            .font(Font.title3.bold())

                        Text("%")
                            .font(Font.caption.bold())
                            .padding(.bottom, 6)
                    }
                    .foregroundColor(.white)
                    .offset(x: geo.size.width / 2 - 20, y: geo.size.height / 2)
                }
            }
        }.frame(width: 140, height: 200)
    }
}


struct VerticalWaterPill_Previews: PreviewProvider {
    static var previews: some View {
        VerticalWaterPillView()
    }
}
