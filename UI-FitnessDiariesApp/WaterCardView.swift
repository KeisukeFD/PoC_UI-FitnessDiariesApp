//
//  WaterCardView.swift
//  UI-FitnessDiariesApp
//
//  Created by Valentin Malissen on 2020-07-23.
//

import SwiftUI

struct WaterCardView: View {
    var body: some View {
        BackCardView {
            HStack {
                VStack(alignment: .leading) {
                    
                    VStack(alignment: .leading) {
                        HStack(alignment: .bottom) {
                            Text("2100")
                                .font(.largeTitle).bold()
                                .foregroundColor(Color("nearlyDarkBlue"))
                            Text("ml")
                                .foregroundColor(Color("nearlyDarkBlue"))
                                .font(.title3).bold()
                                .alignmentGuide(.bottom) { _ in 28 }
                        }.padding(.bottom, 8)
                        
                        Text("of daily goal 3.5L")
                            .foregroundColor(Color("textColor"))
                            .font(Font.callout.bold())
                    }.padding()

                    
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "clock")
                            Text("Last drink 8:26 AM")
                        }
                        .foregroundColor(Color("grayTextColor"))
                        .font(Font.caption.bold())
                        
                        HStack {
                            Image(systemName: "bell.fill")
                                .rotationEffect(.degrees(25), anchor: .center)
                            Text("Your bottle is empty, refill it!")
                        }
                        .foregroundColor(Color("roseDark"))
                        .font(Font.caption.bold())
                    }.padding()
                }
                .overlay(
                    Rectangle().fill(Color("grayTextColor")).frame(height: 1).padding(.leading).offset(y: 10))
                Spacer()
                
                VerticalWaterPillView()
                    .padding(.trailing)
                    .padding(.top)
                    .padding(.bottom)
            }
        }
    }
}

struct WaterCardView_Previews: PreviewProvider {
    static var previews: some View {
        WaterCardView()
    }
}
