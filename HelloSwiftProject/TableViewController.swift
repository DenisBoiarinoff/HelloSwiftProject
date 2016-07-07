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
	let animals: [String] = ["Horse", "Cow", "Camel", "Sheep", "Goat"]

	let students = ["Tom", "Bill", "Tom", "Joe", "Tom"]

	let studentsPhone = ["12345", "23456", "34567", "45678", "56789"]

	let studentsEmail = ["Tom@mail.com", "Bill@mail.com", "Tom1@mail.com", "Joe@mail.com", "Tom2@mail.com"]

	// cell reuse id (cells that scroll out of view can be reused)
	let cellReuseIdentifier = "cell"
	let studentTableViewCell = "StudentTableViewCell"


	// MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

		self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
//		self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: studentTableViewCell)

		 tableView.registerNib(UINib(nibName: studentTableViewCell, bundle: nil), forCellReuseIdentifier: studentTableViewCell)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        return self.students.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCellWithIdentifier(studentTableViewCell, forIndexPath: indexPath) as! StudentTableViewCell

		cell.studentName.text = self.students[indexPath.row]
		cell.studentPhone.text = self.studentsPhone[indexPath.row]
		cell.studentEmeil.text = self.studentsEmail[indexPath.row]

        return cell
    }
    
}
