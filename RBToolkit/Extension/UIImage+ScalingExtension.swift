//
//  UIImage+ScalingExtension.swift
//  RBToolkit
//
//  Created by Ricki Bin Yamin on 23/08/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

public extension UIImage {
	
	func createThumbnail(withSize size: CGSize) -> UIImage? {
		let renderer = UIGraphicsImageRenderer(size: size)
		
		return renderer.image { context in
			self.draw(in: CGRect(origin: .zero, size: size))
		}
	}
}
