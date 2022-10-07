//
//  DateExtension.swift
//  Pictures everywhere! UiKit
//
//  Created by Guadalupe Vlček on 07/10/2022.
//

import Foundation

extension Date {
    var currentDateAsText: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: self)
    }
}
