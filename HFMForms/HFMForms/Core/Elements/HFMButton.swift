//
//  HFMButton.swift
//  HFMForms
//
//  Created by Brian Drelling on 7/10/16.
//  Copyright © 2016 Brian Drelling. All rights reserved.
//

import Foundation
import UIKit



public class HFMButton: UIButton, HFMFormElementProtocol {
	// MARK: - Enums
    
    public enum Style: String {
        case primary = "primary"
        case secondary = "secondary"
        case destructive = "destructive"
        case inline = "inline"
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
    private var heightConstraint: NSLayoutConstraint?
    private var initializer: ((HFMButton) -> Void)?
    private var style: String = Style.primary.rawValue
    
    public var section: HFMFormSectionView?
    
    public var height: CGFloat? {
        didSet {
            self.heightConstraint?.constant = self.height ?? 0
            self.heightConstraint?.isActive = self.height != nil
        }
    }
    
    public var isUppercased: Bool = false {
        didSet {
            self.reinitialize()
            self.setNeedsLayout()
        }
    }

	public var title: String? {
        didSet {
            self.reinitialize()
            self.setNeedsLayout()
		}
	}

	// MARK: - Methods

    // MARK: Initializers
    
    public convenience init(style: Style = .primary, initializer: ((HFMButton) -> Void)? = nil) {
        self.init(style: style.rawValue, initializer: initializer)
    }
    
    public init(style: String, initializer: ((HFMButton) -> Void)? = nil) {
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
        self.heightConstraint = self.heightAnchor.constraint(equalToConstant: self.height ?? 0)
        self.heightConstraint?.isActive = self.height != nil
        
        if let styleInitializer = self.settings.buttonStyles[self.style] {
            styleInitializer(self)
        }
        
        self.initializer?(self)
        
        self.initializer = nil
    }
    
    private func reinitialize() {
        if let title = (self.isUppercased) ? self.title?.uppercased() : self.title {
            self.setTitle(title, for: .normal)
        }
    }
}
