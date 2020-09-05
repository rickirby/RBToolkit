//
//  CGFloat+DynamicDimension.swift
//  RBToolkit
//
//  Created by Ricki Bin Yamin on 23/08/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

public extension CGFloat {
	
	func makeDynamicW() -> CGFloat {
		
		let devWidth = UIScreen.main.bounds.width
		let val = (self / 414) * devWidth
		
		return val
	}
	
	func makeDynamicH() -> CGFloat {
		
		let devHeight = UIScreen.main.bounds.height
		let val = (self / 896) * devHeight
		
		return val
	}
	
}
