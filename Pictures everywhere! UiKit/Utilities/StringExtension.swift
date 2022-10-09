//
//  StringExtension.swift
//  Pictures everywhere! UiKit
//
//  Created by Guadalupe Vlček on 06/10/2022.
//

import UIKit

extension String {
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: "**\(self)**", comment: "")
    }
}
