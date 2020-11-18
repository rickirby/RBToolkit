//
//  ViewController.swift
//  RBToolkit
//
//  Created by Ricki Bin Yamin on 05/09/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

open class ViewController<V: View>: UIViewController {
	
	public var automaticallyAdjustKeyboardLayoutGuide = false {
		willSet {
			newValue ? startObservingKeyboardNotifications() : stopObservingKeyboardNotifications()
		}
	}
	
	public var onKeyboardWillAppear: ((Notification) -> Void)?
	public var onKeyboardWillDisappear: ((Notification) -> Void)?
	
	private var keyboardNotifications: [Notification.Name] {
		[
			UIResponder.keyboardWillHideNotification,
			UIResponder.keyboardWillShowNotification,
			UIResponder.keyboardWillChangeFrameNotification
		]
	}
	
	public var screenView: V {
		return view as! V
	}
	
	deinit {
		stopObservingKeyboardNotifications()
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

private extension ViewController {

	func startObservingKeyboardNotifications() {
		keyboardNotifications.forEach { registerForNotification(name: $0) }
	}

	func stopObservingKeyboardNotifications() {
		keyboardNotifications.forEach { NotificationCenter.default.removeObserver(self, name: $0, object: nil) }
	}

	func registerForNotification(name: Notification.Name) {
		NotificationCenter.default.addObserver(forName: name, object: nil, queue: nil, using: handleNotification(name: name))
	}

	func handleNotification(name: Notification.Name) -> (Notification) -> Void {
		{ [weak self] notification in
			guard let self = self, self.automaticallyAdjustKeyboardLayoutGuide, var offset = notification.keyboardRect?.height else {
				return
			}

			switch name {
			case UIResponder.keyboardWillHideNotification:
				offset = 0
				self.onKeyboardWillDisappear?(notification)
			case UIResponder.keyboardWillShowNotification:
				self.onKeyboardWillAppear?(notification)
			default:
				break
			}

			let animationDuration = notification.keyboardAnimationDuration ?? 0.25
			self.screenView.keyboardHeightConstraint.constant = offset
			UIView.animate(withDuration: animationDuration) {
				self.screenView.layoutIfNeeded()
			}
		}
	}
}

private extension Notification {

	var keyboardAnimationDuration: TimeInterval? {
		(userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue
	}

	var keyboardRect: CGRect? {
		userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
	}
}
