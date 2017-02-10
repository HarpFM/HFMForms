//
//  Operators.swift
//  HFMForms
//
//  Created by Brian Drelling on 7/15/16.
//  Copyright © 2016 Brian Drelling. All rights reserved.
//

import Foundation

precedencegroup FormPrecedence {
    associativity: left
    higherThan: LogicalConjunctionPrecedence
}

infix operator +++: FormPrecedence

@discardableResult
public func +++ (lhs: HFMFormView, rhs: HFMFormSectionView) -> HFMFormView {
	lhs.append(sectionView: rhs)
	return lhs
}

@discardableResult
public func +++ (lhs: HFMFormSectionView, rhs: HFMFormElementProtocol) -> HFMFormSectionView {
	lhs.append(element: rhs)
	return lhs
}
