////
////  HFMSelect.swift
////  HFMForms
////
////  Created by Brian Drelling on 8/21/16.
////  Copyright © 2016 Brian Drelling. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//public class HFMSelect: UIButton, HFMFormFieldProtocol {
//	// MARK: - Enums
//    
//    public enum Color: String {
//        case rose = "Rose"
//        case white = "White"
//    }
//
//	public enum Style: String {
//		case `default` = "Default"
//	}
//
//	// MARK: - Constants
//
//	private static let defaultSidePadding: CGFloat = 8
//
//	// MARK: - Properties
//
//	// MARK: Inspectable
//
//	@IBInspectable public var styleIB: String = "Default" {
//		didSet {
//			self.style = Style(rawValue: styleIB) ?? .default
//		}
//	}
//
//    // MARK: Other
//    
//    public var isParameter: Bool = true
//    public var name: String?
//    public var value: Any?
//    
//    public var onTapped: (() -> Void)?
//    
//    private var color: Color = .white
//    private var heightConstraint: NSLayoutConstraint?
//    private var style: Style = .default
//    
//    public var section: HFMFormSectionView?
//    
//    public var height: CGFloat = 52 {
//        didSet {
//            self.heightConstraint?.constant = self.height
//        }
//    }
//
//	public var title: String? {
//        didSet {
//            self.reinitialize()
//            self.setNeedsLayout()
//		}
//	}
//
//	// MARK: - Methods
//
//	// MARK: Constructors
//
//	public init(style: Style = .default, color: Color = .white, name: String? = nil, initializer: ((HFMSelect) -> Void)? = nil) {
//        super.init(frame: CGRect.zero)
//
//        self.color = color
//		self.name = name
//        self.style = style
//        
//        self.initialize()
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
//	public func onTappedInternal() {
//		self.onTapped?()
//	}
//
//	// MARK: Utilities
//
//    public func initialize() {
//        self.translatesAutoresizingMaskIntoConstraints = false
//        
//		switch (self.style) {
//		default:
//			self.contentHorizontalAlignment = .left
//
//			self.imageView?.contentMode = .center
//
////			self.titleLabel?.font = UIFont(name: Constants.Fonts.Lato.regular, size: 16)
//            
////            switch (self.color) {
////            case .rose:
////                self.backgroundColor = Constants.Colors.primary
////                
////                self.setTitleColor(UIColor.white, for: .normal)
////                self.setTitleColor(UIColor.white.withAlphaComponent(0.35), for: .highlighted)
////                
////                break
////            case .white:
////                self.backgroundColor = UIColor.white
////                
////                self.setTitleColor(Constants.Colors.primary, for: .normal)
////                self.setTitleColor(Constants.Colors.primary.withAlphaComponent(0.35), for: .highlighted)
////                
////                break
////            }
//
//			self.setImage(UIImage(named: "ChevronRight"), for: .normal)
//
//			if let imageWidth = self.imageView?.image?.size.width {
//				self.imageEdgeInsets = UIEdgeInsets(top: 0, left: self.frame.size.width - imageWidth - HFMSelect.defaultSidePadding, bottom: 0, right: HFMSelect.defaultSidePadding)
//				self.titleEdgeInsets = UIEdgeInsets(top: 0, left: HFMSelect.defaultSidePadding - imageWidth, bottom: 0, right: imageWidth + HFMSelect.defaultSidePadding)
//			}
//
//			break
//        }
//        
//        self.heightConstraint = self.heightAnchor.constraint(equalToConstant: self.height)
//        self.heightConstraint?.isActive = true
//        
//        self.addTarget(self, action: #selector(self.onTappedInternal), for: .touchUpInside)
//	}
//    
//    private func reinitialize() {
//        if let title = self.title {
//            self.setTitle(title, for: .normal)
//        }
//    }
//}
