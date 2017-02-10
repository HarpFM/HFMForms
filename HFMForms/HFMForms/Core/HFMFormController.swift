//
//  HFMFormController.swift
//  HFMForms
//
//  Created by Brian Drelling on 7/10/16.
//  Copyright © 2016 Brian Drelling. All rights reserved.
//

import Foundation
import UIKit

open class HFMFormController: UIViewController {
	public typealias Section = HFMFormSectionView

	public typealias Button = HFMButton
	public typealias ImageView = HFMImageView
	public typealias Label = HFMLabel
	public typealias TextField = HFMTextField

	// MARK: - Properties
    
    private var didBuild: Bool = false

	private var _formView: HFMFormView?
    @IBOutlet private weak var formView: HFMFormView!
	{
		get {
			if (self._formView == nil) {
				self._formView = self.getFormView()
			}

			return self._formView
		}
		set {
			self._formView = newValue
		}
	}

	public var form: HFMFormView {
		return self.formView!
	}

	// MARK: - Methods

	// MARK: Overrides

	open override func viewDidLoad() {
		super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        self.view.backgroundColor = UIColor.white
	}
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if (!self.didBuild) {
            self.build(form: self.form)
            
            self.form.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor).isActive = true
            self.form.bottomAnchor.constraint(equalTo: self.bottomLayoutGuide.topAnchor).isActive = true
            self.form.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
            self.form.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
            
            self.didBuild = true
        }
    }

	// MARK: Utilities

	open func build(form: HFMFormView) {
	}

	public func rebuildForm() {
		self.formView = nil
		self.build(form: self.form)
	}

	private func getFormView() -> HFMFormView {
		let formView = HFMFormView()
        
        self.view.addSubview(formView)
        
		return formView
	}
}
