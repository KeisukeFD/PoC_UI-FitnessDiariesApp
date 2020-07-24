//
//  TabBarView.swift
//  UI-FitnessDiariesApp
//
//  Created by Valentin Malissen on 2020-07-22.
//

import SwiftUI
import Combine


enum Tab: String, CaseIterable {
    case Home = "home"
    case Run = "run"
    case Nutrition = "nutrition"
    case Profile = "profile"
}


struct TabBarView: View {
    @ObservedObject var viewRouter = ViewRouter()
    
    @State var showTabBarForAnimation = false
    
    var body: some View {
        ZStack {
            Color("backColor")
            
            ScrollView {
                switch(self.viewRouter.currentView) {
                    case Tab.Home:
                        HomeView()
                    case Tab.Run:
                        RunView()
                    case Tab.Nutrition:
                        Text("Nutrition")
                    case Tab.Profile:
                        Text("Profile")
                }
                Text("")
                    .padding(.bottom, 180)
            }
            .offset(y: 35)
            
            if self.showTabBarForAnimation {
                GeometryReader { geo in
                    CircleButtonView(image: "plus", action: {
                        print("Show: ", self.viewRouter.currentView)
                    })
                        .frame(width: 60, height: 60)
                        .offset(x: geo.size.width / 2 - 30, y: geo.size.height - 100 - 30)


                    
                    TabShape()
                        .fill(Color.white)
                        .frame(height: 100)
                        .offset(y: geo.size.height - 100)
                        .shadow(color: Color("backColorShadow"), radius: 15, x: 0, y: 8)

                    HStack(spacing: 25) {
                        TabBarItemView(mainImage: "tab_1", isSelected: self.viewRouter.currentView == Tab.Home, selectedImage: "tab_1s")
                            .onTapGesture {
                                self.viewRouter.currentView = Tab.Home
                            }
                        TabBarItemView(mainImage: "tab_2", isSelected: self.viewRouter.currentView == Tab.Run, selectedImage: "tab_2s")
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    self.viewRouter.currentView = Tab.Run
                                }
                            }
                    }.offset(x: 20, y: geo.size.height - 79)


                    HStack(spacing: 25) {
                        TabBarItemView(mainImage: "tab_3", isSelected: self.viewRouter.currentView == Tab.Nutrition, selectedImage: "tab_3s")
                            .onTapGesture {
                                self.viewRouter.currentView = Tab.Nutrition
                            }
                        TabBarItemView(mainImage: "tab_4", isSelected: self.viewRouter.currentView == Tab.Profile, selectedImage: "tab_4s")
                            .onTapGesture {
                                self.viewRouter.currentView = Tab.Profile
                            }
                    }.offset(x: geo.size.width - 130, y: geo.size.height - 79)
                }
                .transition(.move(edge: .bottom))
                .animation(.spring())
            }
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            withAnimation {
                self.showTabBarForAnimation = true
            }
        }
    }
}


struct TabShape: Shape {
    func path(in rect: CGRect) -> Path {
            Path { p in
                p.move(to: CGPoint(x: 0, y: rect.height))
                p.addLine(to: CGPoint(x: 0, y: rect.height-75))
                p.addArc(center: CGPoint(x: 30, y: rect.height - 70), radius: 30, startAngle: .degrees(180), endAngle: .degrees(270), clockwise: false)
                p.addLine(to: CGPoint(x: (rect.width / 2) - 65, y: rect.height - 100))
                
                p.addArc(center: CGPoint(x: rect.midX - 64, y: rect.height - 70), radius: 30, startAngle: .degrees(270), endAngle: .degrees(0), clockwise: false)
                p.addArc(center: CGPoint(x: rect.midX, y: rect.height - 100), radius: 41, startAngle: .degrees(150), endAngle: .degrees(25), clockwise: true)
                p.addArc(center: CGPoint(x: rect.midX + 64, y: rect.height - 70), radius: 30, startAngle: .degrees(190), endAngle: .degrees(270), clockwise: false)
                
                p.addLine(to: CGPoint(x: rect.width - 65, y: rect.height - 100))
                p.addArc(center: CGPoint(x: rect.width-30, y: rect.height - 70), radius: 30, startAngle: .degrees(270), endAngle: .degrees(0), clockwise: false)
                p.addLine(to: CGPoint(x: rect.width, y: rect.height))
            }
    }
}


struct TabBarItemView: View {
    var mainImage: String
    var isSelected: Bool = false
    var selectedImage: String? = nil
    
    var body: some View {
        HStack {
            if isSelected {
                if let selectedImg = selectedImage {
                    Image("\(selectedImg)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 42)
                } else {
                    Image("\(mainImage)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 42)
                        .overlay(Rectangle().frame(width: 10, height: 2).background(Color.blue.opacity(0.2)).opacity(0.2), alignment: .bottom)
                }
            } else {
                Image("\(mainImage)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 42)
            }
        }
    }
}


class ViewRouter: ObservableObject {
    @Published var currentView = Tab.Home
}


struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
