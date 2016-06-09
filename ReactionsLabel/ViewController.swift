//
//  ViewController.swift
//  ReactionsLabel
//
//  Created by John on 6/7/16.
//  Copyright © 2016 jmmanos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet var reactionsLabel : ReactionsLabel!

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		let reactions : [ReactionType] = [.Like, .Like, .Like, .Love, .Laugh, .Shocked, .Angry, .Sad, .Shocked]
		
		reactionsLabel?.setReactions(reactions)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

