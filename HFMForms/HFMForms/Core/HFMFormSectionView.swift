//
//  HFMFormSectionView.swift
//  HFMForms
//
//  Created by Brian Drelling on 7/15/16.
//  Copyright © 2016 Brian Drelling. All rights reserved.
//

import Foundation
import UIKit

public class HFMFormSectionView: UIView {
	// MARK: - Enums

    public enum Anchor {
        case footer
		case header
	}

	// MARK: - Constants

	static let inset: CGFloat = 20

	// MARK: - Properties

    private var stackView: UIStackView = UIStackView()
    
    public var anchor: Anchor = .header
    public var name: String?
    
    internal var form: HFMFormView?
    
    private var axis: UILayoutConstraintAxis = .vertical
    private var didBuild: Bool = false
    
    public var alignment: UIStackViewAlignment {
        get {
            return self.stackView.alignment
        }
        set {
            self.stackView.alignment = newValue
        }
    }

	public var parameters: [String: Any]? {
		guard (self.name?.isEmpty == false) else {
			return nil
		}

		var parameters = [String: Any]()

		for formField in self.formFields.filter({ $0.name != nil }) {
			if let name = formField.name, let value = formField.value {
				parameters[name] = value
			}
		}

		return parameters
	}

	public var spacing: CGFloat {
		get {
			return self.stackView.spacing
		}
		set {
			self.stackView.spacing = newValue
		}
	}

	public var formFields: [HFMFormFieldProtocol] {
		return self.stackView.arrangedSubviews.convert()
	}

	// MARK: - Methods

	// MARK: Constructors

    public init(anchor: Anchor = .header, axis: UILayoutConstraintAxis = .vertical, name: String? = nil, initializer: ((HFMFormSectionView) -> Void)? = nil) {
		super.init(frame: CGRect.zero)

		self.anchor = anchor
        self.axis = axis
		self.name = name

		self.initialize()

		initializer?(self)
	}

	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.initialize()
	}

	private func initialize() {
		self.addSubview(self.stackView)
        
        self.translatesAutoresizingMaskIntoConstraints = false

		self.stackView.axis = self.axis
        self.stackView.spacing = 10
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        
        if (self.axis == .horizontal) {
            self.stackView.distribution = .fill
        }
    }
    
    // MARK: Overrides
    
    public override func updateConstraints() {
        if (!self.didBuild) {
            self.stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            self.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            self.stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            
            for view in self.stackView.arrangedSubviews {
                if (self.axis == .vertical) {
                    view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: HFMFormSectionView.inset).isActive = true
                    view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -HFMFormSectionView.inset).isActive = true
                }
            }
            
            self.didBuild = true
        }
        
        super.updateConstraints()
    }

	// MARK: Utilities

	public func append(element: HFMFormElementProtocol) {
        element.section = self
        
		if let view = element as? UIView {
            self.append(view: view)
		}
	}

    private func append(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.setContentCompressionResistancePriority(UILayoutPriorityRequired, for: .horizontal)
        view.setContentHuggingPriority(UILayoutPriorityRequired, for: .horizontal)
        
		self.stackView.addArrangedSubview(view)
	}
}
