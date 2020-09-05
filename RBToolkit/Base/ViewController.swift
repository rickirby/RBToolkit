//
//  ViewController.swift
//  RBToolkit
//
//  Created by Ricki Bin Yamin on 05/09/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

open class ViewController<V: View>: UIViewController {
	
	public var screenView: V {
		return view as! V
	}
	
	open override func loadView() {
		view = V()
	}
	
	open override func viewDidLoad() {
		super.viewDidLoad()
		screenView.onViewDidLoad()
	}
	
	open override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		screenView.onViewWillAppear()
	}
	
	open override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		screenView.onViewDidAppear()
	}
	
	open override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		screenView.onViewWillDisappear()
	}
	
	open override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
		screenView.onViewDidDisappear()
	}
	
	open override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		screenView.onViewWillLayoutSubviews()
	}
	
	open override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		screenView.onViewDidLayoutSubviews()
	}
	
}
