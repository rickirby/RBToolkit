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

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		title = "Example"
		setNavigationBarColor(backgroundColor: .orange, textColor: .white, tintColor: .white)
	}

	@IBAction func buttonTapped(_ sender: UIButton) {
		let vc = ProgrammaticalViewController()
		navigationController?.pushViewController(vc, animated: true)
	}
	
}

