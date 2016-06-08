//
//  Love.swift
//  ReactionViewExample
//
//  Created by John on 6/6/16.
//  Copyright © 2016 jmmanos. All rights reserved.
//

import UIKit

public struct Love : Reaction {
	public var backgroundColor : UIColor {
		return UIColor(red: 255/255, green: 40/255, blue: 81/255, alpha: 1)
	}
	
	public var scale : CGFloat {
		return 0.7
	}
	
	public var layerConfigurations : [LayerConfiguration] {
		let heartPath : [PathOperation] = [
			.MoveTo(CGPoint(x: 0.5, y: 0.2)),
			.AddCurve((CGPoint(x: 0.9525,y: 0.5125),CGPoint(x: 0.66,y: 0.03),CGPoint(x: 1.04,y: 0.12))),
			.AddCurve((CGPoint(x: 0.5,y: 0.92),CGPoint(x: 0.9,y: 0.71),CGPoint(x: 0.7,y: 0.86)) ),
			.AddCurve((CGPoint(x: 0.04, y: 0.41),CGPoint(x: 0.38,y: 0.92), CGPoint(x: 0.045,y: 0.755))),
			.AddCurve((CGPoint(x: 0.5,y: 0.2), CGPoint(x: 0.04,y: 0.11),  CGPoint( x: 0.35, y: 0.05))),
			.Close
		]
		
		return [
			LayerConfiguration( name : "heart", fillColor : UIColor.whiteColor(), path : heartPath )
		]
	}
}