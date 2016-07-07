//
//  TextViewController.swift
//  HelloSwiftProject
//
//  Created by Rhinoda3 on 01.07.16.
//  Copyright © 2016 Rhinoda. All rights reserved.
//

import UIKit

class TextViewController: UIViewController, UITextViewDelegate {

	@IBOutlet weak var textView: UITextView!

	@IBOutlet weak var bottom: NSLayoutConstraint!

	var lustLine : CGRect = CGRectNull
	// MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

		self.automaticallyAdjustsScrollViewInsets = false

		textView.setContentOffset(CGPointZero, animated: false)

		textView.delegate = self
    }

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		registerForKeyboardNotifications()
	}

	override func viewWillDisappear(animated: Bool) {
		super.viewWillDisappear(animated)
		deregisterFromKeyboardNotifications()
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

	// MARK: - Text View Delegate

	func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
		if(text == "\n") {
			textView.resignFirstResponder()
			return false
		}
		return true
	}

	func textViewDidChange(textView: UITextView) {
		let selectedRange: UITextRange? = textView.selectedTextRange
		let line = textView.caretRectForPosition(selectedRange!.start)

		let overflow : CGFloat = line.origin.y + line.size.height
			- (textView.contentOffset.y + textView.bounds.size.height
				- textView.contentInset.bottom - textView.contentInset.top)
		if (overflow > 0) {
			var offset : CGPoint = textView.contentOffset
			offset.y += overflow + 7;
			UIView.animateWithDuration(0.2, animations: {
				textView.setContentOffset(offset, animated: true)
			})
		}
	}

	// MARK: - Keyboard Events

	func keyboardWasShown(notification: NSNotification) {
//		let userInfo = notification.userInfo!
//
//		let keyboardScreenEndFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
//		let keyboardViewEndFrame = view.convertRect(keyboardScreenEndFrame, fromView: view.window)
//		textView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height, right: 0)
//
//		textView.scrollIndicatorInsets = textView.contentInset
//
//		let selectedRange = textView.selectedRange
//		textView.scrollRangeToVisible(selectedRange)
/*----------------------------------------------------------------------------------------------*/
			var info = notification.userInfo!
			let keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
		    let keyboardCorrectFrame = view.convertRect(keyboardFrame, fromView: nil)

			UIView.animateWithDuration(0.1, animations: { () -> Void in
				self.bottom.constant = keyboardCorrectFrame.size.height + 20
			})
/*----------------------------------------------------------------------------------------------*/

	}

	func keyboardWillBeHidden(notification: NSNotification) {
//		textView.setContentOffset(CGPointZero, animated: true)
/*---------------------------------------------------------------------------*/
		UIView.animateWithDuration(0.1, animations: { () -> Void in
			self.bottom.constant = 60
		})
	}

	// MARK: - Utility Functions

	func registerForKeyboardNotifications() {
		NSNotificationCenter.defaultCenter().addObserver(
			self,
			selector: #selector(keyboardWasShown),
			name: UIKeyboardWillShowNotification,
			object: nil)

		NSNotificationCenter.defaultCenter().addObserver(
			self,
			selector: #selector(keyboardWillBeHidden),
			name: UIKeyboardWillHideNotification,
			object: nil)
	}

	func deregisterFromKeyboardNotifications() {
		NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
		NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
	}

}
