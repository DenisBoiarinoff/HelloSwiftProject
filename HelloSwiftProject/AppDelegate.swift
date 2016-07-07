//
//  AppDelegate.swift
//  HelloSwiftProject
//
//  Created by Rhinoda3 on 30.06.16.
//  Copyright © 2016 Rhinoda. All rights reserved.
//

import UIKit

//#import "HelloSwiftProject-Swift.h"

//import MainViewController

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	var navigationController: UINavigationController?

	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
		self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
		// Override point for customization after application launch.
		self.window!.backgroundColor = UIColor.whiteColor()
		self.window!.makeKeyAndVisible()
		// approach without storyboard
		// Step 1: create view controller instance
		// Step 2: create a navigation controller with view controller instance as root
		// Step 3: navigation controller instance is set as rootviewcontroller of the window
		let studyController: MainViewController? = MainViewController(nibName: "MainViewController", bundle: nil)
		self.navigationController = UINavigationController(rootViewController: studyController!)
		self.window!.rootViewController = self.navigationController

		return true
	}

	func applicationWillResignActive(application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
	}

	func applicationDidEnterBackground(application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}

	func applicationWillEnterForeground(application: UIApplication) {
		// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
	}

	func applicationDidBecomeActive(application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}

	func applicationWillTerminate(application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	}


}

