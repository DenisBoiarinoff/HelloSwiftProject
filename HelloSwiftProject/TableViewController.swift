//
//  TableViewController.swift
//  HelloSwiftProject
//
//  Created by Rhinoda3 on 01.07.16.
//  Copyright © 2016 Rhinoda. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

	// Data model: These strings will be the data for the table view cells

	let studentsGroup: NSDictionary? = [
		0 : ["name": "Tom", "phone": "12345", "email": "Tom@mail.com"],
		1 : ["name": "Bill", "phone": "23456", "email": "Bill@mail.com"],
		2 : ["name": "Tom", "phone": "34567", "email": "Tom1@mail.com"],
		3 : ["name": "Joe", "phone": "45678", "email": "Joe@mail.com"],
		4 : ["name": "Tom", "phone": "56789", "email": "Tom2@mail.com"],
	]

	// cell reuse id (cells that scroll out of view can be reused)
	let cellReuseIdentifier = "cell"
	let studentTableViewCell = "StudentTableViewCell"


	// MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

		self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)

		 tableView.registerNib(UINib(nibName: studentTableViewCell, bundle: nil), forCellReuseIdentifier: studentTableViewCell)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return studentsGroup!.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCellWithIdentifier(studentTableViewCell, forIndexPath: indexPath) as! StudentTableViewCell

		let student: NSDictionary = studentsGroup![indexPath.row] as! NSDictionary

		cell.studentName.text = student["name"] as? String;
		cell.studentPhone.text = student["phone"]as? String;
		cell.studentEmeil.text = student["email"]as? String;

        return cell
    }
    
}
