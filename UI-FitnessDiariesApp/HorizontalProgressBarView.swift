//
//  HorizontalProgressBarView.swift
//  UI-FitnessDiariesApp
//
//  Created by Valentin Malissen on 2020-07-23.
//

import SwiftUI


struct HorizontalProgressBarView: View {
    var progress: CGFloat = 0.6
    
    var color: Color

    var body: some View {
        ZStack {
            GeometryReader { geo in
                let progressWidth = ((progress * geo.size.width) / 100) * 100
                let gradientColors = [color, color.opacity(0.3)].shuffled()
                RoundedRectangle(cornerRadius: 25)
                    .fill(color.opacity(0.1))
                    .frame(height: 8)

                RoundedRectangle(cornerRadius: 25)
                    .fill(LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .leading, endPoint: .trailing))
                    .frame(width: progressWidth, height: 8)
                    .animation(.linear)
            }
        }
    }
}


struct HorizontalProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalProgressBarView(progress: 0.6, color: Color("nearlyDarkBlue"))
    }
}
