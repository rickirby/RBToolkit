//
//  Notification+Extension.swift
//  RBToolkit
//
//  Created by Ricki Private on 18/11/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

private extension Notification {

	var keyboardAnimationDuration: TimeInterval? {
		(userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue
	}

	var keyboardRect: CGRect? {
		userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
	}
}
