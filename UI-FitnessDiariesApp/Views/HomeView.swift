//
//  HomeView.swift
//  UI-FitnessDiariesApp
//
//  Created by Valentin Malissen on 2020-07-23.
//

import SwiftUI


struct HomeView: View {
    @State var currentDate = Date()

    @State var showingView = false
    @State var mealsCardsShowing = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("My Diary")
                    .font(.title)
                    .bold()
                
                Spacer(minLength: 60)
                // DayChooserView
                DayChooser(current: $currentDate)
                    .font(.system(size: 14))
            }.padding()
            
            if self.showingView {
                TitleWithMore(title: "Mediterranean diet", detail: "Details", detailAction: {})
                    .transition(.slideFromRightToLeft)
                    .animation(.delayed(by: 0))

                DietStatsView()
                    .padding(.leading)
                    .padding(.trailing)
                    .transition(.slideFromRightToLeft)
                    .animation(.delayed(by: 1))


                TitleWithMore(title: "Meals today", detail: "Customize", detailAction: {})
                    .transition(.slideFromRightToLeft)
                    .animation(.delayed(by: 2))


                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        if(self.mealsCardsShowing) {
                            MealsCard(title: "Breakfast", shortDescription: "Bread,\nPeanut butter,\nApple", calories: 525, imageName: "breakfast", firstColor: Color("orangeDark"), secondColor: Color("orangeLight"))
                                .transition(.slideFromRightToLeft)
                                .animation(.delayed(by: 0))

                            MealsCard(title: "Lunch", shortDescription: "Salmon,\nMixed veggies, \nAvocado", calories: 602, imageName: "lunch", firstColor: Color("violetDark"), secondColor: Color("violetLight"))
                                .transition(.slideFromRightToLeft)
                                .animation(.delayed(by: 1))

                            MealsCard(title: "Snack", shortDescription: "Bread,\nNutella\n", calories: 422, imageName: "snack", firstColor: Color("roseDark"), secondColor: Color("roseLight"))
                                .transition(.slideFromRightToLeft)
                                .animation(.delayed(by: 2))

                        }
                    }.padding(.trailing)
                    .padding(.leading)
                    .padding(.top, -10)
                    .transition(.slideFromRightToLeft)
                    .animation(.delayed(by: 3))
                    .onAppear {
                        withAnimation(.easeInOut) {
                            self.mealsCardsShowing = true
                        }
                    }
                }
                
                TitleWithMore(title: "Body measurement", detail: "Today", detailAction: {})

                BodyMeasurementView()
                    .padding(.leading)
                    .padding(.trailing)

                TitleWithMore(title: "Water", detail: "Aqua SmartBottle", detailAction: {})

                WaterCardView()
                    .padding(.leading)
                    .padding(.trailing)

                InformationMessageView(message: "Prepare your stomach for lunch with one or two flass of water")
                    .padding()
            }
        }.onAppear {
            withAnimation(.easeIn(duration: 0.8)) {
                self.showingView = true
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
