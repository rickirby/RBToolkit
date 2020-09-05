//
//  UIImage+ScalingExtension.swift
//  RBToolkit
//
//  Created by Ricki Bin Yamin on 23/08/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

public extension UIImage {
	
	func createThumbnail(_ maxPixelSize: Int) -> UIImage? {
		
		var result: UIImage? = nil
		
		if let imageData = self.pngData(){
			
			let options = [
				kCGImageSourceCreateThumbnailWithTransform: true,
				kCGImageSourceCreateThumbnailFromImageAlways: true,
				kCGImageSourceThumbnailMaxPixelSize: maxPixelSize] as CFDictionary
			
			imageData.withUnsafeBytes { ptr in
				
				guard let bytes = ptr.baseAddress?.assumingMemoryBound(to: UInt8.self) else { return }
				
				if let cfData = CFDataCreate(kCFAllocatorDefault, bytes, imageData.count){
					
					let source = CGImageSourceCreateWithData(cfData, nil)!
					let imageReference = CGImageSourceCreateThumbnailAtIndex(source, 0, options)!
					let thumbnail = UIImage(cgImage: imageReference)
					
					result = thumbnail
				}
			}
		}
		
		return result
	}
}
