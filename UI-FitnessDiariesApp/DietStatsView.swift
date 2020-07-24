//
//  DietStatsView.swift
//  UI-FitnessDiariesApp
//
//  Created by Valentin Malissen on 2020-07-23.
//

import SwiftUI


struct DietStatsView: View {
    @State var consumedCalories: CGFloat = 752
    @State var totalCalories: CGFloat = 2255
    
    @State var eatenCalories: Int = 662
    @State var burnedCalories: Int = 89

    var body: some View {
        BackCardView {
            HStack {
                VStack(alignment: .leading, spacing: 30) {
                    HorizontalStatsView(name: "Eaten", imageName: "eaten", calories: self.eatenCalories, color: Color("veryLightBlue"))
                    HorizontalStatsView(name: "Burned", imageName: "burned", calories: self.burnedCalories, color: Color("veryLightRed"))
                }
                Spacer()
                CircleStatsView(value: self.consumedCalories, total: self.totalCalories, width: 180)

            }.padding()
            .padding(.top, 10)
            .overlay(Rectangle().fill(Color("veryLightBlue")).frame(height: 1).padding(.leading).padding(.trailing), alignment: .bottomLeading)

            HStack {
                VerticalStatsView(name: "Carbs", color: Color("nearlyDarkBlue"), value: 108, total: 120)
                    .padding()
                
                VerticalStatsView(name: "Protein", color: Color("nearlyDarkRed"), value: 60, total: 110)
                    .padding()
                
                VerticalStatsView(name: "Fat", color: Color("nearlyDarkYellow"), value: 6, total: 22)
                    .padding()
                
            }.padding(.leading)
            .padding(.trailing)
            
        }
    }
}


fileprivate struct HorizontalStatsView: View {
    var name: String
    var imageName: String
    var calories: Int
    var color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("\(name)")
                .font(.callout)
                .foregroundColor(Color("grayTextColor"))
                .bold()

            HStack(alignment: .bottom) {
                Image("\(imageName)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding(.leading, -4)
                    .padding(.trailing, -4)
                    .padding(.bottom, -4)
                
                Text("\(String(format: "%d", self.calories))")
                    .foregroundColor(Color("textColor"))
                    .bold()
                
                Text("kcal")
                    .foregroundColor(Color("grayTextColor"))
                    .bold()
                    .font(.caption)
            }
        }
        .padding(.leading)
        .overlay(Rectangle().fill(self.color).frame(width: 2), alignment: .topLeading)
    }
}


fileprivate struct VerticalStatsView: View {
    var name: String
    var color: Color
    var value: CGFloat
    var total: CGFloat
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(name)")
                .foregroundColor(Color("textColor"))
                .font(.callout)
                .bold()
            
            let progress = ((value * 100) / total) / 100
            HorizontalProgressBarView(progress: progress, color: color)
            
            let left = Int(total - value)
            Text("\(String(format: "%d", left))g left")
                .font(.caption)
                .foregroundColor(Color("grayTextColor"))
        }
    }
}


fileprivate struct CircleStatsView: View {
    var value: CGFloat
    var total: CGFloat
    var width: CGFloat = 180
    
    var body: some View {
        ZStack {
            let progress = ((self.value * 100) / self.total) / 100
            Circle()
                .stroke(lineWidth: 4)
                .fill(Color("veryLightBlue"))
            
            Circle()
                .trim(from: 0.0, to: min(progress, 1.0))
                .stroke(style: StrokeStyle(lineWidth: 12, lineCap: .round, lineJoin: .round))
                .fill(
                    LinearGradient(gradient: Gradient(colors: [Color("endBlueGradient"), Color("nearlyDarkBlue")]), startPoint: .leading, endPoint: .trailing)
                )
                .rotationEffect(.degrees(270), anchor: .center)
                .animation(.linear)
            
            let rotationProgress = Double((progress * 180) / 0.5)
            Circle()
                .trim(from: 0.0, to: 0.001)
                .rotation(.degrees(-90), anchor: .center)
                .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
                .fill(Color.white)
                .rotationEffect(.degrees(rotationProgress), anchor: .center)
                .animation(.linear)
                .gesture(DragGesture()
                            .onChanged({ (value) in
                                print(value)
                            }))
            
            VStack {
                let leftKCal = Int(total - value)
                Text("\(String(format: "%d", leftKCal))")
                    .foregroundColor(Color("nearlyDarkBlue"))
                    .font(.title)

                Text("kcal left")
                    .foregroundColor(Color("grayTextColor"))
                    .font(.caption)
                    .bold()
            }
        }.frame(width: self.width)
    }
}


struct DietStatsView_Previews: PreviewProvider {
    static var previews: some View {
        DietStatsView()
    }
}
