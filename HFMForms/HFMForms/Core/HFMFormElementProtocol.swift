//
//  HFMFormElementProtocol.swift
//  HFMForms
//
//  Created by Brian Drelling on 7/15/16.
//  Copyright © 2016 Brian Drelling. All rights reserved.
//

public protocol HFMFormElementProtocol: class {
    var section: HFMFormSectionView? { get set }
    
    func initialize()
}

public protocol HFMFormFieldProtocol: HFMFormElementProtocol {
	var name: String? { get set }
	var value: Any? { get set }
}

extension HFMFormElementProtocol {
    var settings: HFMFormSettings {
        return self.section?.form?.settings ?? HFMFormSettings.shared
    }
}
