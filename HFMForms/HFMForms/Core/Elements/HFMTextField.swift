//
//  HFMTextField.swift
//  HFMForms
//
//  Created by Brian Drelling on 7/10/16.
//  Copyright © 2016 Brian Drelling. All rights reserved.
//

import Foundation
import UIKit

public class HFMTextField: UITextField, HFMFormFieldProtocol {
	// MARK: - Enums
    
	public enum Style: String {
		case `default` = "default"
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
    
	public var name: String?
	public var sidePadding: CGFloat = 0

    private var didBuild: Bool = false
    private var heightConstraint: NSLayoutConstraint?
    private var initializer: ((HFMTextField) -> Void)?
    private var style: String = Style.default.rawValue
    
    public var section: HFMFormSectionView?
    
    public var height: CGFloat = 44 {
        didSet {
            self.heightConstraint?.constant = self.height
        }
    }
    
    public var padding: UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: self.sidePadding, bottom: 0, right: self.sidePadding)
    }

	public var value: Any? {
		get {
			return self.text
		}
		set {
			if let val = newValue {
                // TODO: Fix this
				self.text = String(describing: val)
			}
		}
	}

	// MARK: - Methods

    // MARK: Constructors
    
    public convenience init(style: Style = .default, name: String? = nil, initializer: ((HFMTextField) -> Void)? = nil) {
        self.init(style: style.rawValue, name: name, initializer: initializer)
    }
    
    public init(style: String, name: String? = nil, initializer: ((HFMTextField) -> Void)? = nil) {
        super.init(frame: CGRect.zero)
        
        self.name = name
        self.style = style
        
        self.initialize()
        
        initializer?(self)
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
    
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, self.padding)
    }

	public override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
		return UIEdgeInsetsInsetRect(bounds, self.padding)
    }
    
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, self.padding)
    }
    
    // MARK: Utilities
    
    public func initialize() {
        self.heightConstraint = self.heightAnchor.constraint(equalToConstant: self.height)
        self.heightConstraint?.isActive = true
        
        if let styleInitializer = self.settings.textFieldStyles[self.style] {
            styleInitializer(self)
        }
        
        self.initializer?(self)
        
        self.initializer = nil
        
        if let placeholder = self.placeholder, let placeholderColor = self.textColor?.withAlphaComponent(0.65) {
            self.setPlaceholder(text: placeholder, color: placeholderColor)
        }
    }
}
