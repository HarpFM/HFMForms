//
//  HFMFormSettings.swift
//  HFMForms
//
//  Created by Brian Drelling on 1/11/17.
//  Copyright © 2017 Harp.fm. All rights reserved.
//

import Foundation

public class HFMFormSettings {
    // MARK: - Shared Instance
    
    private static var _shared: HFMFormSettings!
    
    public static var shared: HFMFormSettings {
        if (self._shared == nil) {
            self._shared = HFMFormSettings()
            self._shared.initialize()
        }
        
        return self._shared
    }
    
    // MARK: - Properties
    
    // MARK: Styles Arrays
    
    public var buttonStyles = [String: ((HFMButton) -> Void)]()
    public var imageViewStyles = [String: ((HFMImageView) -> Void)]()
    public var labelStyles = [String: ((HFMLabel) -> Void)]()
    public var textFieldStyles = [String: ((HFMTextField) -> Void)]()
    
    // MARK: Settings
    
    public var backgroundColor = UIColor.white
    
    // MARK: Settings - Button
    
    public var primaryButtonBackgroundColor: UIColor = UIColor.blue
    public var primaryButtonBorderColor: UIColor = UIColor.clear
    public var primaryButtonBorderWidth: CGFloat = 0
    public var primaryButtonCornerRadius: CGFloat = 2
    public var primaryButtonFontSize: CGFloat = 16
    public var primaryButtonHeight: CGFloat = 52
    public var primaryButtonIsUppercased: Bool = true
    public var primaryButtonTitleColor: UIColor = UIColor.white
    
    public var secondaryButtonBackgroundColor: UIColor = UIColor.green
    public var secondaryButtonBorderColor: UIColor = UIColor.clear
    public var secondaryButtonBorderWidth: CGFloat = 0
    public var secondaryButtonCornerRadius: CGFloat = 2
    public var secondaryButtonFontSize: CGFloat = 16
    public var secondaryButtonHeight: CGFloat = 52
    public var secondaryButtonIsUppercased: Bool = true
    public var secondaryButtonTitleColor: UIColor = UIColor.white
    
    public var destructiveButtonBackgroundColor: UIColor = UIColor.red
    public var destructiveButtonBorderColor: UIColor = UIColor.clear
    public var destructiveButtonBorderWidth: CGFloat = 0
    public var destructiveButtonCornerRadius: CGFloat = 2
    public var destructiveButtonFontSize: CGFloat = 16
    public var destructiveButtonHeight: CGFloat = 52
    public var destructiveButtonIsUppercased: Bool = true
    public var destructiveButtonTitleColor: UIColor = UIColor.white
    
    public var inlineButtonFontSize: CGFloat = 16
    public var inlineButtonTitleColor: UIColor = UIColor.white
    
    // MARK: Settings - Label
    
    public var defaultLabelFontSize: CGFloat = 16
    public var defaultLabelTextAlignment: NSTextAlignment = .center
    public var defaultLabelTextColor: UIColor = UIColor.darkText
    
    public var titleLabelFontSize: CGFloat? = 24
    public var titleLabelTextAlignment: NSTextAlignment?
    public var titleLabelTextColor: UIColor?
    
    public var subtitleLabelFontSize: CGFloat?
    public var subtitleLabelTextAlignment: NSTextAlignment?
    public var subtitleLabelTextColor: UIColor?
    
    public var sectionTitleLabelFontSize: CGFloat?
    public var sectionTitleLabelTextAlignment: NSTextAlignment?
    public var sectionTitleLabelTextColor: UIColor?
    
    public var footnoteLabelFontSize: CGFloat?
    public var footnoteLabelTextAlignment: NSTextAlignment?
    public var footnoteLabelTextColor: UIColor?
    
    public var bodyLabelFontSize: CGFloat = 12
    public var bodyLabelTextAlignment: NSTextAlignment = .left
    public var bodyLabelTextColor: UIColor?
    
    // MARK: Settings - TextField
    
    public var defaultTextFieldSidePadding: CGFloat = 8
    
    // MARK: Settings - ImageView
    
    public var logo: UIImage?
    
    public var logoImageViewHeight: CGFloat = 128
    public var logoImageViewContentMode: UIViewContentMode = .center
    
    // MARK: Fonts
    
    public var boldFontName: String = UIFont.systemFont(ofSize: 1).fontName
    public var lightFontName: String = UIFont.systemFont(ofSize: 1).fontName
    public var regularFontName: String = UIFont.systemFont(ofSize: 1).fontName
    
    // MARK: - Methods
    
    // MARK: Initializers
    
    private func initialize() {
        self.buttonStyles = self.getButtonStyles()
        self.imageViewStyles = self.getImageViewStyles()
        self.labelStyles = self.getLabelStyles()
        self.textFieldStyles = self.getTextFieldStyles()
    }
    
    // MARK: Utilities
    
    private func getButtonStyles() -> [String: ((HFMButton) -> Void)] {
        var styles = [String: ((HFMButton) -> Void)]()
        
        styles[HFMButton.Style.primary.rawValue] = { button in
            button.backgroundColor = self.primaryButtonBackgroundColor
            button.titleLabel?.font = UIFont(name: self.regularFontName, size: self.primaryButtonFontSize)
            
            button.borderColor = self.primaryButtonBorderColor
            button.borderWidth = self.primaryButtonBorderWidth
            button.cornerRadius = self.primaryButtonCornerRadius
            button.height = self.primaryButtonHeight
            button.isUppercased = self.primaryButtonIsUppercased
            
            button.setTitleColor(self.primaryButtonTitleColor, for: .normal)
            button.setTitleColor(self.primaryButtonTitleColor.withAlphaComponent(0.35), for: .highlighted)
        }
        
        styles[HFMButton.Style.secondary.rawValue] = { button in
            button.backgroundColor = self.secondaryButtonBackgroundColor
            button.titleLabel?.font = UIFont(name: self.regularFontName, size: self.secondaryButtonFontSize)
            
            button.borderColor = self.secondaryButtonBorderColor
            button.borderWidth = self.secondaryButtonBorderWidth
            button.cornerRadius = self.secondaryButtonCornerRadius
            button.height = self.secondaryButtonHeight
            button.isUppercased = self.secondaryButtonIsUppercased
            
            button.setTitleColor(self.secondaryButtonTitleColor, for: .normal)
            button.setTitleColor(self.secondaryButtonTitleColor.withAlphaComponent(0.35), for: .highlighted)
        }
        
        styles[HFMButton.Style.destructive.rawValue] = { button in
            button.backgroundColor = self.destructiveButtonBackgroundColor
            button.titleLabel?.font = UIFont(name: self.regularFontName, size: self.destructiveButtonFontSize)
            
            button.borderColor = self.destructiveButtonBorderColor
            button.borderWidth = self.destructiveButtonBorderWidth
            button.cornerRadius = self.destructiveButtonCornerRadius
            button.height = self.destructiveButtonHeight
            button.isUppercased = self.destructiveButtonIsUppercased
            
            button.setTitleColor(self.destructiveButtonTitleColor, for: .normal)
            button.setTitleColor(self.destructiveButtonTitleColor.withAlphaComponent(0.35), for: .highlighted)
        }
        
        styles[HFMButton.Style.inline.rawValue] = { button in
            button.titleLabel?.font = UIFont(name: self.regularFontName, size: self.inlineButtonFontSize)
            
            button.backgroundColor = UIColor.clear
            
            button.setTitleColor(self.inlineButtonTitleColor, for: .normal)
            button.setTitleColor(self.inlineButtonTitleColor.withAlphaComponent(0.35), for: .highlighted)
        }
        
        return styles
    }
    
    private func getImageViewStyles() -> [String: ((HFMImageView) -> Void)] {
        var styles = [String: ((HFMImageView) -> Void)]()
        
        styles[HFMImageView.Style.logo.rawValue] = { imageView in
            imageView.contentMode = self.logoImageViewContentMode
            imageView.height = self.logoImageViewHeight
            imageView.image = self.logo
        }
        
        return styles
    }
    
    private func getLabelStyles() -> [String: ((HFMLabel) -> Void)] {
        var styles = [String: ((HFMLabel) -> Void)]()
        
        styles[HFMLabel.Style.title.rawValue] = { label in
            label.font = UIFont(name: self.boldFontName, size: self.titleLabelFontSize ?? self.defaultLabelFontSize)
            label.numberOfLines = 0
            label.textAlignment = self.titleLabelTextAlignment ?? self.defaultLabelTextAlignment
            label.textColor = self.titleLabelTextColor ?? self.defaultLabelTextColor
        }
        
        styles[HFMLabel.Style.subtitle.rawValue] = { label in
            label.font = UIFont(name: self.regularFontName, size: self.subtitleLabelFontSize ?? self.defaultLabelFontSize)
            label.numberOfLines = 0
            label.textAlignment = self.subtitleLabelTextAlignment ?? self.defaultLabelTextAlignment
            label.textColor = self.subtitleLabelTextColor ?? self.defaultLabelTextColor
        }
        
        styles[HFMLabel.Style.sectionTitle.rawValue] = { label in
            label.font = UIFont(name: self.regularFontName, size: self.sectionTitleLabelFontSize ?? self.defaultLabelFontSize)
            label.numberOfLines = 0
            label.textAlignment = self.sectionTitleLabelTextAlignment ?? self.defaultLabelTextAlignment
            label.textColor = self.sectionTitleLabelTextColor ?? self.defaultLabelTextColor
        }
        
        styles[HFMLabel.Style.footnote.rawValue] = { label in
            label.font = UIFont(name: self.regularFontName, size: self.footnoteLabelFontSize ?? self.defaultLabelFontSize)
            label.numberOfLines = 0
            label.textAlignment = self.footnoteLabelTextAlignment ?? self.defaultLabelTextAlignment
            label.textColor = self.footnoteLabelTextColor ?? self.defaultLabelTextColor
        }
        
        styles[HFMLabel.Style.body.rawValue] = { label in
            label.font = UIFont(name: self.regularFontName, size: self.bodyLabelFontSize ?? self.defaultLabelFontSize)
            label.numberOfLines = 0
            label.textAlignment = self.bodyLabelTextAlignment ?? self.defaultLabelTextAlignment
            label.textColor = self.bodyLabelTextColor ?? self.defaultLabelTextColor
        }
        
        return styles
    }
    
    private func getTextFieldStyles() -> [String: ((HFMTextField) -> Void)] {
        var styles = [String: ((HFMTextField) -> Void)]()
        
        styles[HFMTextField.Style.default.rawValue] = { textField in
            textField.autocorrectionType = .no
            textField.autocapitalizationType = .none
            textField.spellCheckingType = .no
            
            textField.backgroundColor = UIColor.white
            textField.textColor = UIColor.black
            
            textField.sidePadding = self.defaultTextFieldSidePadding
        }
        
        return styles
    }
}
