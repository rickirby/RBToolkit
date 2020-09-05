//
//  UIView+SubviewExtension.swift
//  RBToolkit
//
//  Created by Ricki Bin Yamin on 23/08/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

public extension UIView {
	
	func addAllSubviews(views: [UIView]) {
		
		for everyView in views {
			
			self.addSubview(everyView)
		}
	}
}
