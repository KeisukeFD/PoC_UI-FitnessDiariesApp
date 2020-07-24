//
//  AnimationExtension.swift
//  UI-FitnessDiariesApp
//
//  Created by Valentin Malissen on 2020-07-24.
//

import SwiftUI


extension Animation {
    static func delayed(by number: Int) -> Animation {
        Animation.easeIn(duration: 0.3)
            .delay(0.1 * Double(number))
    }
}


extension AnyTransition {
    static var slideFromRightToLeft: AnyTransition {
        let into = AnyTransition.move(edge: .trailing)
        let out = AnyTransition.move(edge: .leading)
        return AnyTransition.asymmetric(insertion: into, removal: out)
    }
}
