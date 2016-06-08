//
//  LayerConfig.swift
//  ReactionViewExample
//
//  Created by John on 6/6/16.
//  Copyright © 2016 jmmanos. All rights reserved.
//

import UIKit

public struct LayerConfiguration {
	public let name: String
	public let fillColor : UIColor
	public let strokeColor : UIColor
	public let rotation : CGFloat
	public let path : [PathOperation]
	
	public init( name : String, fillColor : UIColor = .clearColor(), strokeColor : UIColor = .clearColor(), rotation : CGFloat = 0.0, path : [PathOperation] ) {
		self.name = name
		self.fillColor = fillColor
		self.strokeColor = strokeColor
		self.rotation = rotation
		self.path = path
	}
}