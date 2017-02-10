//
//  ArrayExtensions.swift
//  HFMForms
//
//  Created by Brian Drelling on 1/11/17.
//  Copyright © 2017 Harp.fm. All rights reserved.
//

import Foundation

extension Array {
    func convert<T>() -> [T] {
        return self.filter({ $0 as? T != nil }).map({ $0 as! T })
    }
}
