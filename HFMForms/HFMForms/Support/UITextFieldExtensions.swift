//
//  UITextFieldExtensions.swift
//  HFMForms
//
//  Created by Brian Drelling on 1/11/17.
//  Copyright © 2017 Harp.fm. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func setPlaceholder(text: String, color: UIColor) {
        self.attributedPlaceholder = NSAttributedString(string: text, attributes: [NSForegroundColorAttributeName: color])
    }
}
