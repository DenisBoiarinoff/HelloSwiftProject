//
//  LoginViewController.swift
//  HelloSwiftProject
//
//  Created by Rhinoda3 on 01.07.16.
//  Copyright © 2016 Rhinoda. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

	@IBOutlet weak var firsrNameTextField: UITextField!
	@IBOutlet weak var lastNametextField: UITextField!
	@IBOutlet weak var passTextField: UITextField!
	@IBOutlet weak var confirmPassTextField: UITextField!

	@IBOutlet weak var scrollView: UIScrollView!

	let startPoint : CGPoint = CGPointMake(0, -65)
	
	var textVieewFrame: CGRect!

	//MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
		scrollView.setContentOffset(startPoint, animated: false)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)

		registerForKeyboardNotifications()
	}

	override func viewWillDisappear(animated: Bool) {
		super.viewWillDisappear(animated)

		deregisterFromKeyboardNotifications()
	}

	//MARK: - Text Field Delegate

	func textFieldDidBeginEditing(textField: UITextField) {
		textVieewFrame = textField.frame
	}

	func textFieldShouldReturn(textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}

	//MARK: - Buttons Actions

	@IBAction func loginAction(sender: AnyObject) {
		let pass = self.passTextField.text
		let confirmPass = self.confirmPassTextField.text

		if (pass == confirmPass) {
			if (pass != "") {
				let alert = UIAlertController(title: "Login", message: "You are logged in", preferredStyle: UIAlertControllerStyle.Alert)
				alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
				self.presentViewController(alert, animated: true, completion: nil)
			}
		} else {
			let alert = UIAlertController(title: "Login", message: "Wrong pass", preferredStyle: UIAlertControllerStyle.Alert)
			alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
			self.presentViewController(alert, animated: true, completion: nil)
		}
	}

	//MARK: - Keyboard Events

	func keyboardWasShown(notification: NSNotification) {
		if let userInfo = notification.userInfo {
			if let keyboardFrame = userInfo[UIKeyboardFrameEndUserInfoKey]?.CGRectValue() {
				let keyboardCorrectFrame = view.convertRect(keyboardFrame, fromView: nil)
				var visibleRect = self.view.frame
				visibleRect.size.height -= keyboardCorrectFrame.size.height
				let textViewCorrectFrame = view.convertRect(self.textVieewFrame, fromView: scrollView)
				let scrollPoint = CGPointMake(0.0, self.textVieewFrame.origin.y + self.textVieewFrame.size.height + 10 - visibleRect.size.height)
				if (!CGRectContainsPoint(visibleRect, CGPointMake(0.0, textViewCorrectFrame.origin.y + textViewCorrectFrame.size.height + 10))) {
					scrollView.setContentOffset(scrollPoint, animated: true)
				}
			}
		}
/*-----------------------------------------------------------------------------*/
//		if let userInfo = notification.userInfo {
//			if let keyboardFrame = userInfo[UIKeyboardFrameEndUserInfoKey]?.CGRectValue() {
//				let keyboardCorrectFrame = view.convertRect(keyboardFrame, fromView: nil)
//				var visibleRect = self.view.frame
//				visibleRect.size.height -= keyboardCorrectFrame.size.height
//				let scrollPoint = CGPointMake(0.0, self.textVieewFrame.origin.y + self.textVieewFrame.size.height + 10 - visibleRect.size.height)
////				if (!CGRectContainsPoint(visibleRect, scrollPoint)) {
//					scrollView.setContentOffset(scrollPoint, animated: true)
////				}
//			}
//		}
	}

	func keyboardWillBeHidden(notification: NSNotification) {
//		scrollView.setContentOffset(startPoint, animated: true)
	}

	//MARK: - Utility Functions

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
