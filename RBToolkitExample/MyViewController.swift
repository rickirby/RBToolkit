//
//  MyViewController.swift
//  RBToolkitExample
//
//  Created by Ricki Bin Yamin on 05/09/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit
import RBToolkit

class MyViewController: UIViewController {

	@IBOutlet weak var imageView: UIImageView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		title = "Example"
		setNavigationBarColor(backgroundColor: .orange, textColor: .white, tintColor: .white)
		imageView.contentMode = .scaleAspectFill
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		DispatchQueue.global(qos: .userInitiated).async {
			let image = #imageLiteral(resourceName: "earth")
			let imageSize = image.size
			let resizedImage = image.createThumbnail(withSize: CGSize(width: imageSize.width / 10, height: imageSize.height / 10))
			
			DispatchQueue.main.async {
				self.imageView.image = resizedImage
			}
		}
	}

	@IBAction func buttonTapped(_ sender: UIButton) {
		let vc = ProgrammaticalViewController()
		navigationController?.pushViewController(vc, animated: true)
	}
	
}

