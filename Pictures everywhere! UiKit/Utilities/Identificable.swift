//
//  Identificable.swift
//  Pictures everywhere! UiKit
//
//  Created by Guadalupe Vlček on 06/10/2022.
//

import UIKit

protocol Identificable {
    static var identifier: String { get }
}

extension Identificable {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UIViewController: Identificable {}

extension UIView: Identificable {}
