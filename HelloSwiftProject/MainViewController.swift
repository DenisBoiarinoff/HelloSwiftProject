//
//  MainViewController.swift
//  HelloSwiftProject
//
//  Created by Rhinoda3 on 30.06.16.
//  Copyright © 2016 Rhinoda. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

	// MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	// MARK: - Buttons Actions

	@IBAction func toLoginController(sender: AnyObject) {
		let loginVC: LoginViewController = LoginViewController()
		self.navigationController!.pushViewController(loginVC, animated: false)
	}

	@IBAction func toTextController(sender: AnyObject) {
		let textVC: TextViewController = TextViewController()
		self.navigationController!.pushViewController(textVC, animated: false)
	}

	@IBAction func toTableController(sender: AnyObject) {
		let tableVC: TableViewController = TableViewController()
		self.navigationController!.pushViewController(tableVC, animated: false)
	}

}
