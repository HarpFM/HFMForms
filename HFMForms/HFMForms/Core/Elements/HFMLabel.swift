//
//  HFMLabel.swift
//  HFMForms
//
//  Created by Brian Drelling on 7/10/16.
//  Copyright © 2016 Brian Drelling. All rights reserved.
//

import Foundation
import UIKit

public class HFMLabel: UILabel, HFMFormElementProtocol {
	// MARK: - enums

	public enum Style: String {
        case body = "body"
		case footnote = "footnote"
		case sectionTitle = "sectionTitle"
		case subtitle = "subtitle"
		case title = "title"
	}

    // MARK: - Properties
    
    // MARK: Inspectable
    
    @IBInspectable public var styleIB: String? {
        didSet {
            if let style = self.styleIB {
                self.style = style
            }
        }
    }

	// MARK: Other
    
    private var didBuild: Bool = false
    private var initializer: ((HFMLabel) -> Void)?
    private var style: String = Style.body.rawValue
    
    public var section: HFMFormSectionView?

	// MARK: - Methods

	// MARK: Initializers
    
    public convenience init(style: Style = .body, initializer: ((HFMLabel) -> Void)? = nil) {
        self.init(style: style.rawValue, initializer: initializer)
    }

	public init(style: String, initializer: ((HFMLabel) -> Void)? = nil) {
        super.init(frame: CGRect.zero)
        
        self.initializer = initializer
        self.style = style
	}

	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
    }
    
    // MARK: Overrides
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        if (!self.didBuild) {
            self.initialize()
            
            self.didBuild = true
        }
    }

    // MARK: Utilities
    
    public func initialize() {
        if let styleInitializer = self.settings.labelStyles[self.style] {
            styleInitializer(self)
        }
        
        self.initializer?(self)
        
        self.initializer = nil
    }
}
