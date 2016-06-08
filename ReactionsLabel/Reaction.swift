//
//  ReactionType.swift
//  ReactionViewExample
//
//  Created by John on 6/6/16.
//  Copyright © 2016 jmmanos. All rights reserved.
//

import UIKit

public protocol Reaction {
	var scale : CGFloat { get }
	var backgroundColor : UIColor { get }
	var layerConfigurations : [LayerConfiguration] { get }
}