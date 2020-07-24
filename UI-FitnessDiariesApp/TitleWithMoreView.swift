//
//  TitleWithMore.swift
//  UI-FitnessDiariesApp
//
//  Created by Valentin Malissen on 2020-07-23.
//

import SwiftUI


struct TitleWithMoreView: View {
    var title: String
    var detail: String
    var detailAction: () -> Void
    
    var body: some View {
        HStack(alignment: .bottom) {
            Text("\(title)")
                .font(.title3)
                .bold()
                .foregroundColor(Color("textColor"))
            Spacer()
            
            HStack {
                Text("\(detail)")
                    .font(.system(size: 14))
                    .bold()
                    .foregroundColor(Color("linkColor"))
                Image(systemName: "arrow.right")
                    .foregroundColor(Color("textColor"))
            }.onTapGesture {
                self.detailAction()
            }
        }
        .padding()
    }
}


struct TitleWithMore_Previews: PreviewProvider {
    static var previews: some View {
        TitleWithMoreView(title: "Mediterranean diet", detail: "Details", detailAction: {
            print("Blah")
        })
    }
}
