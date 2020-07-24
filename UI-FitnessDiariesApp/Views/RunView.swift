//
//  HomeView.swift
//  UI-FitnessDiariesApp
//
//  Created by Valentin Malissen on 2020-07-23.
//

import SwiftUI


struct RunView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Training")
                    .font(.title)
                    .bold()
            }.padding()
            
            TitleWithMoreView(title: "Your program", detail: "Details", detailAction: {})
            
            BackCardView(backgroundColors: [Color("gradientDarkCardBlue"), Color("gradientLightCardBlue")]) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Next workout")

                    Text("Legs Toning and\nGlutes Workout at Home")
                        .font(.title3)
                        .padding(.bottom, 20)

                    HStack(alignment: .bottom) {
                        HStack {
                            Image(systemName: "stopwatch")
                            Text("68 min")
                        }
                        Spacer()
                        CircleButtonView(image: "play", action: {

                        }, backgroundColors: [.white], foregroundColor: Color("gradientDarkCardBlue"))
                    }.font(Font.body.bold())
                    .frame(height: 40)
                    .padding(.top)

                }.padding()
                .foregroundColor(.white)
            }.padding()
            .padding(.top, -15)

            BackSimpleCardViewWithCustomBack {
                Image("back")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .cornerRadius(10)

                Image("runner")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 140)
                    .offset(y: -40)
                    .padding(.bottom, -30)

                VStack(alignment: .leading) {
                    Spacer()
                    Text("You're doing great !")
                        .font(Font.callout.bold())
                        .foregroundColor(Color("nearlyDarkBlue"))
                    Text("Keep it up\nand stick to your plan!")
                        .font(Font.caption)
                        .foregroundColor(Color("grayTextColor"))
                    Spacer()
                }.padding(.leading, 140)

            }.frame(height: 100)
            .padding()
            .padding(.bottom, -15)
            
            TitleWithMoreView(title: "Area of focus", detail: "more", detailAction: {})
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                ForEach(["area1", "area2", "area3"], id: \.self) { i in
                    BackSimpleCardView {
                        Image("\(i)")
                            .resizable()
                            .scaledToFit()
                    }.padding()
                }
            }
        }
    }
}


struct RunView_Previews: PreviewProvider {
    static var previews: some View {
        RunView()
    }
}
