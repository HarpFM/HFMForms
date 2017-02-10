//
//  HFMFormView.swift
//  HFMForms
//
//  Created by Brian Drelling on 7/15/16.
//  Copyright © 2016 Brian Drelling. All rights reserved.
//

import Foundation
import UIKit

public class HFMFormView: UIView {
	// MARK: - Properties

	private var scrollView: UIScrollView = UIScrollView()

	private var footerStackView: UIStackView = UIStackView()
	private var headerStackView: UIStackView = UIStackView()
    private var stackView: UIStackView = UIStackView()
    
    private var stackViewHeightConstraint: NSLayoutConstraint?
    private var stackViewWidthConstraint: NSLayoutConstraint?

	private var sections: [HFMFormSectionView] {
		return self.headerStackView.arrangedSubviews.convert() +
			self.footerStackView.arrangedSubviews.convert()
	}
    
    private var didBuild: Bool = false
    
    public var parameters: [String: Any] {
        var parameters = [String: Any]()
        
        for section in self.sections {
            if (section.name?.isEmpty == false) {
                if let name = section.name {
                    parameters[name] = section.parameters
                }
            } else {
                for formField in section.formFields.filter({ $0.name?.isEmpty == false }) {
                    if let name = formField.name {
                        parameters[name] = formField.value
                    }
                }
            }
        }
        
        return parameters
    }
    
    public var settings: HFMFormSettings = HFMFormSettings.shared
    
    // Margins
    
    public var bottomMargin: CGFloat = 20 {
        didSet {
            self.updateMargins()
        }
    }
    
    public var leftMargin: CGFloat = 0 {
        didSet {
            self.updateMargins()
        }
    }
    
    public var rightMargin: CGFloat = 0 {
        didSet {
            self.updateMargins()
        }
    }
    
    public var topMargin: CGFloat = 40 {
        didSet {
            self.updateMargins()
        }
    }
    
    // Spacings

	public var footerSpacing: CGFloat {
		get {
			return self.footerStackView.spacing
		}
		set {
			self.footerStackView.spacing = newValue
		}
	}

	public var headerSpacing: CGFloat {
		get {
			return self.headerStackView.spacing
		}
		set {
			self.headerStackView.spacing = newValue
		}
	}
    
	// MARK: - Methods

	// MARK: Constructors

	public init() {
		super.init(frame: CGRect.zero)
		self.initialize()
	}

	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.initialize()
	}

	private func initialize() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
		self.addSubview(self.scrollView)

        self.scrollView.addSubview(self.stackView)

		self.stackView.addArrangedSubview(self.headerStackView)
        self.stackView.addArrangedSubview(self.footerStackView)
        
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false

		self.stackView.axis = .vertical
        self.stackView.distribution = .equalSpacing
        self.stackView.spacing = 60 // FIXME: This seems hacky
        self.stackView.translatesAutoresizingMaskIntoConstraints = false

		self.headerStackView.axis = .vertical
        self.headerStackView.spacing = 40
        self.headerStackView.translatesAutoresizingMaskIntoConstraints = false

		self.footerStackView.alignment = .center
        self.footerStackView.axis = .vertical
        self.footerStackView.translatesAutoresizingMaskIntoConstraints = false
	}
    
    // MARK: Overrides
    
    public override func updateConstraints() {
        // TODO: Add headerStackView and footerStackView all with in full stack view
        // Set equalCentering as the distribution mode.
        // This sould put header at top and footer at bottom always
        
        if (!self.didBuild) {
            self.scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            self.scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            self.scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            self.scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
            
            self.stackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor).isActive = true
            self.stackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor).isActive = true
            self.stackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor).isActive = true
            self.stackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor).isActive = true
            
            self.stackViewHeightConstraint = self.stackView.heightAnchor.constraint(greaterThanOrEqualTo: self.scrollView.heightAnchor)
            self.stackViewHeightConstraint?.isActive = true
            
            self.stackView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor).isActive = true
//            
//            //        self.headerStackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor)
//            
//            self.headerStackView.snp.remakeConstraints { (make) in
//                self.headerTopConstraint = make.top.equalTo(self.scrollView).inset(self.headerMargin).constraint
//            }
//            
//            self.footerStackView.snp.remakeConstraints { (make) in
//                self.footerBottomConstraint = make.bottom.equalTo(self.scrollView).inset(self.footerMargin).constraint
//            }
            
            for section in self.sections {
                section.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
                section.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
            }
            
            self.updateMargins()
            
            self.didBuild = true
        }
        
        super.updateConstraints()
    }

	// MARK: Subscripts

	public subscript(name: String) -> Any? {
		return self.getParameter(name: name)
	}

	// MARK: Utilities

	public func append(sectionView: HFMFormSectionView) {
        sectionView.form = self
        
		if (sectionView.anchor == .header) {
			self.headerStackView.addArrangedSubview(sectionView)
		} else {
			self.footerStackView.addArrangedSubview(sectionView)
		}
	}

	private func getParameter(name: String) -> Any? {
		return self.parameters[name]
    }
    
    public func updateMargins() {
        self.scrollView.contentInset = UIEdgeInsets(top: self.topMargin, left: self.leftMargin, bottom: self.bottomMargin, right: self.rightMargin)
        
        self.stackViewHeightConstraint?.constant = -self.topMargin - self.bottomMargin
        self.stackViewWidthConstraint?.constant = -self.leftMargin - self.rightMargin
    }
}
