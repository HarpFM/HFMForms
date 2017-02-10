//
//  HFMImageView.swift
//  HFMForms
//
//  Created by Brian Drelling on 7/19/16.
//  Copyright © 2016 Brian Drelling. All rights reserved.
//

import Foundation
import UIKit

public class HFMImageView: UIImageView, HFMFormElementProtocol {
	// MARK: - Enums

	public enum Style: String {
		case `default` = "default"
		case logo = "logo"
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
    private var initializer: ((HFMImageView) -> Void)?
    private var style: String = Style.default.rawValue
    
    public var section: HFMFormSectionView?
    
    public var height: CGFloat? {
        didSet {
            self.heightConstraint?.constant = self.height ?? 0
            self.heightConstraint?.isActive = self.height != nil
        }
    }

	// MARK: - Methods

    // MARK: Constructors
    
    public convenience init(style: Style = .default, initializer: ((HFMImageView) -> Void)? = nil) {
        self.init(style: style.rawValue, initializer: initializer)
    }
    
    public init(style: String, initializer: ((HFMImageView) -> Void)? = nil) {
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
        
        if let styleInitializer = self.settings.imageViewStyles[self.style] {
            styleInitializer(self)
        }
        
        self.initializer?(self)
        
        self.initializer = nil
    }
}
