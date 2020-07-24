//
//  DayChooser.swift
//  UI-FitnessDiariesApp
//
//  Created by Valentin Malissen on 2020-07-23.
//

import SwiftUI


struct DayChooserView: View {
    @Binding var current: Date

    private static let dayMonthFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM"
        return formatter
    }()
    
    var body: some View {
        HStack {
            Button(action: {
                self.current = self.current.addDay(-1)
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(Color("textColor"))
            }
                
            Spacer()
            
            Image(systemName: "calendar")
                .foregroundColor(Color("textColor"))
                .padding(.trailing, 10)
            
            Text("\(current, formatter: DayChooserView.dayMonthFormatter)")
                .foregroundColor(Color("textColor"))
                .bold()

            Spacer()
            Button(action: {
                self.current = self.current.addDay(1)
            }) {
                Image(systemName: "chevron.right")
                    .foregroundColor(Color("textColor"))
            }
        }
    }
}


struct DayChooser_Previews: PreviewProvider {
    @State static var current = Date()
    static var previews: some View {
        DayChooserView(current: $current)
    }
}
