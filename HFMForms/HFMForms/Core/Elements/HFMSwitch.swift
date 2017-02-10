////
////  HFMSwitch.swift
////  HFMForms
////
////  Created by Brian Drelling on 8/10/16.
////  Copyright © 2016 Brian Drelling. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//public class HFMSwitch: UIView, HFMFormElementProtocol {
//	// MARK: - Properties
//
//	private var innerLabel: HFMLabel?
//    private var innerSwitch: UISwitch?
//    private var stackView: UIStackView?
//    
//    public var section: HFMFormSectionView?
//    
//    public var onSwitchValueChanged: ((Bool) -> Void)?
//
//	public var enabled: Bool {
//		get {
//			return self.innerSwitch?.isOn ?? false
//		}
//		set {
//			self.innerSwitch?.isOn = newValue
//		}
//	}
//
//	public var text: String? {
//		get {
//			return self.innerLabel?.text
//		}
//		set {
//			self.innerLabel?.text = newValue
//		}
//	}
//
//	// MARK: - Methods
//
//	// MARK: Constructors
//
//	public init(initializer: ((HFMSwitch) -> Void)? = nil) {
//        super.init(frame: CGRect.zero)
//
//		self.initialize()
//
//		initializer?(self)
//	}
//
//	public required init?(coder aDecoder: NSCoder) {
//		super.init(coder: aDecoder)
//    }
//
//	// MARK: Events
//
//	public func onSwitchValueChangedInternal() {
//		self.onSwitchValueChanged?(self.enabled)
//	}
//
//	// MARK: Utilities
//
//    public func initialize() {
//        self.translatesAutoresizingMaskIntoConstraints = false
//        
//		let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//
//		let innerLabel = HFMLabel(style: .sectionTitle)
//
//		let innerSwitch = UISwitch()
//		innerSwitch.addTarget(self, action: #selector(self.onSwitchValueChangedInternal), for: .valueChanged)
//
//		self.addSubview(stackView)
//
//		stackView.addArrangedSubview(innerLabel)
//
//		stackView.addArrangedSubview(innerSwitch)
//
//		self.stackView = stackView
//		self.innerLabel = innerLabel
//		self.innerSwitch = innerSwitch
//        
//        self.stackView?.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        self.stackView?.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//        self.stackView?.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
//        self.stackView?.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
//	}
//}
