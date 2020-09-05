//
//  View.swift
//  RBToolkit
//
//  Created by Ricki Bin Yamin on 05/09/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

open class View: UIView {
	
	public override init(frame: CGRect) {
		super.init(frame: frame)
		setViews()
	}
	
	public required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	open func setViews() {} // Run on loadView()
	open func onViewDidLoad() {}
	open func onViewWillAppear() {}
	open func onViewDidAppear() {}
	open func onViewWillDisappear() {}
	open func onViewDidDisappear() {}
	open func onViewWillLayoutSubviews() {}
	open func onViewDidLayoutSubviews() {}
}
