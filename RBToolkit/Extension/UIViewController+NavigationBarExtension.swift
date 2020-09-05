//
//  UIViewController+NavigationBarExtension.swift
//  RBToolkit
//
//  Created by Ricki Bin Yamin on 23/08/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

public extension UIViewController {
	
	func setLargeTitleDisplayMode(_ largeTitleDisplayMode: UINavigationItem.LargeTitleDisplayMode) {
		
		switch largeTitleDisplayMode {
			
		case .automatic:
			guard let navigationController = navigationController else { break }
			
			if let index = navigationController.children.firstIndex(of: self) {
				
				setLargeTitleDisplayMode(index == 0 ? .always : .never)
			} else {
				
				setLargeTitleDisplayMode(.always)
			}
			
		case .always, .never:
			navigationItem.largeTitleDisplayMode = largeTitleDisplayMode
			navigationController?.navigationBar.prefersLargeTitles = true
			
		@unknown default:
			assertionFailure("\(#function): Missing handler for \(largeTitleDisplayMode)")
		}
	}
	
	func setNavigationBarColor(backgroundColor: UIColor?, textColor: UIColor?, tintColor: UIColor?) {
		
		let navBarAppearance = UINavigationBarAppearance()
		navBarAppearance.configureWithOpaqueBackground()
		navBarAppearance.titleTextAttributes = [.foregroundColor: textColor ?? .black]
		navBarAppearance.largeTitleTextAttributes = [.foregroundColor: textColor ?? .black]
		navBarAppearance.backgroundColor = backgroundColor ?? .white
		navigationController?.navigationBar.tintColor = tintColor ?? .systemBlue
		navigationController?.navigationBar.standardAppearance = navBarAppearance
		navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
	}
}
