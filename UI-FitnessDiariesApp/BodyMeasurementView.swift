//
//  BodyMeasurementView.swift
//  UI-FitnessDiariesApp
//
//  Created by Valentin Malissen on 2020-07-23.
//

import SwiftUI


struct BodyMeasurementView: View {
    var body: some View {
        BackCardView {
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Text("Weight")
                        .font(.title3).bold()
                        .foregroundColor(Color("textColor"))
                        .padding(.bottom)
                    
                    
                    HStack(alignment: .bottom) {
                        Text("206.8")
                            .font(.largeTitle).bold()
                            .foregroundColor(Color("nearlyDarkBlue"))
                            
                        Text("lbs")
                            .foregroundColor(Color("nearlyDarkBlue"))
                            .font(.title3).bold()
                            .alignmentGuide(.bottom) { _ in 28 }
                    }
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    HStack {
                        Image(systemName: "clock")
                        Text("Today 8:26 AM")
                    }.foregroundColor(Color("grayTextColor"))
                    .font(Font.callout.bold())
                    
                    Text("InBody SmartScale")
                        .foregroundColor(Color("nearlyDarkBlue"))
                }.font(.system(size: 14))
            }.padding()
            .overlay(
                Rectangle().fill(Color("grayTextColor")).frame(height: 1).padding(.leading).padding(.trailing), alignment: .bottom)
            .padding(.bottom)
            
            HStack {
                BodyLabelView(title: "Height", value: "185 cm")
                Spacer()
                BodyLabelView(title: "Overweight", value: "27.3 BMI")
                Spacer()
                BodyLabelView(title: "Body fat", value: "20%")
            }.padding(.leading)
            .padding(.trailing)
            .padding(.bottom)
        }
    }
}


fileprivate struct BodyLabelView: View {
    var title: String
    var value: String
    
    var body: some View {
        VStack {
            Text("\(value)")
                .foregroundColor(Color("textColor"))
                .font(Font.title3.bold())
            
            Text("\(title)")
                .foregroundColor(Color("grayTextColor"))
                .font(Font.callout.bold())
        }
    }
}


struct BodyMeasurementView_Previews: PreviewProvider {
    static var previews: some View {
        BodyMeasurementView()
    }
}
