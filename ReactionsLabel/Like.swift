//
//  Like.swift
//  ReactionViewExample
//
//  Created by John on 6/6/16.
//  Copyright © 2016 jmmanos. All rights reserved.
//

import UIKit

public struct Like : Reaction {
	public var backgroundColor : UIColor {
		return UIColor(red: 22/255, green: 118/255, blue: 255/255, alpha: 1)
	}
	
	public var scale : CGFloat {
		return 0.55
	}
	
	public var layerConfigurations : [LayerConfiguration] {
		let handPath : [PathOperation] = [
			.MoveTo(CGPoint(x: 0.89, y: 0.27)),
			.AddCurve((CGPoint(x: 0.9,y: 0.42),CGPoint(x: 0.97,y: 0.27),CGPoint(x: 0.98,y: 0.41))),
			.AddCurve((CGPoint(x: 0.88,y: 0.56),CGPoint(x: 0.98,y: 0.44),CGPoint(x: 0.97,y: 0.555)) ),
			.AddCurve((CGPoint(x: 0.87, y: 0.69),CGPoint(x: 0.96,y: 0.58), CGPoint(x: 0.945,y: 0.68))),
			.AddCurve((CGPoint(x: 0.86,y: 0.81), CGPoint(x: 0.93,y: 0.71),  CGPoint( x: 0.92, y: 0.8))),
			.AddLine(CGPoint( x: 0.38, y: 0.81)),
			.AddCurve((CGPoint( x: 0.35, y: 0.77), CGPoint( x: 0.34, y: 0.81),  CGPoint( x: 0.35, y: 0.77))),
			.AddLine(CGPoint( x: 0.35, y: 0.4)),
			.AddCurve((CGPoint( x: 0.55, y: 0.07), CGPoint( x: 0.35, y: 0.335),  CGPoint( x: 0.41, y: 0.18))),
			.AddLine(CGPoint( x: 0.55, y: -0.03)),
			.AddCurve((CGPoint( x: 0.69, y: 0.04), CGPoint( x: 0.55, y: -0.11),  CGPoint( x: 0.69, y: -0.11))),
			.AddCurve((CGPoint( x: 0.63, y: 0.27), CGPoint( x: 0.69, y: 0.15),  CGPoint(  x: 0.63, y: 0.27))),
			.AddLine(CGPoint( x: 0.89, y: 0.27)),
			.Close
		]
		let armPath = [PathOperation.RoundedRect(CGRect(x:0.03, y:0.36,width:0.25,height:0.52), 0.03)]
		
		return [
			LayerConfiguration( name : "hand", fillColor : UIColor.whiteColor(), path : handPath ),
			LayerConfiguration( name : "arm", fillColor : UIColor.whiteColor(), path : armPath )
		]
	}
}