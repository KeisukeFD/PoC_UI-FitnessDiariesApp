//
//  DateExtension.swift
//  UI-FitnessDiariesApp
//
//  Created by Valentin Malissen on 2020-07-23.
//

import SwiftUI


extension Date {
    func addDay(_ number: Int) -> Date {
        var dateComponent = DateComponents()
        dateComponent.day = number
        return Calendar.current.date(byAdding: dateComponent, to: self)!
    }
}
