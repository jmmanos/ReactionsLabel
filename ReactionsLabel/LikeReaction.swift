//
//  Like.swift
//  ReactionViewExample
//
//  Created by John on 6/6/16.
//  Copyright © 2016 jmmanos. All rights reserved.
//

import UIKit

public struct LikeReaction : Reaction {
	public var backgroundColor : UIColor {
		return UIColor(red: 22/255, green: 118/255, blue: 255/255, alpha: 1)
	}
	
	public var scale : CGFloat {
		return 1
	}
	
	public var layerConfigurations : [LayerConfiguration] {
		let handPath : [PathOperation] = [
			.MoveTo(CGPoint(x: 0.735, y: 0.4225)),
			.AddCurve((CGPoint(x: 0.735,y: 0.51),CGPoint(x: 0.775,y: 0.4225),CGPoint(x: 0.785,y: 0.5025))),
			.AddCurve((CGPoint(x: 0.725,y: 0.59),CGPoint(x: 0.785,y: 0.52),CGPoint(x: 0.7725,y: 0.59)) ),
			.AddCurve((CGPoint(x: 0.7175, y: 0.665),CGPoint(x: 0.77,y: 0.605), CGPoint(x: 0.76,y: 0.66))),
			.AddCurve((CGPoint(x: 0.71,y: 0.735), CGPoint(x: 0.75,y: 0.675),  CGPoint( x: 0.75, y: 0.7275))),
			.AddLine(CGPoint( x: 0.43, y: 0.735)),
			.AddCurve((CGPoint( x: 0.415, y: 0.72), CGPoint( x: 0.415, y: 0.735),  CGPoint( x: 0.415, y: 0.72))),
			.AddLine(CGPoint( x: 0.415, y: 0.5)),
			.AddCurve((CGPoint( x: 0.53, y: 0.305), CGPoint( x: 0.415, y: 0.465),  CGPoint( x: 0.43, y: 0.395))),
			.AddLine(CGPoint( x: 0.53, y: 0.25)),
			.AddCurve((CGPoint( x: 0.6125, y: 0.29), CGPoint( x: 0.53, y: 0.2),  CGPoint( x: 0.6125, y: 0.1945))),
			.AddCurve((CGPoint( x: 0.575, y: 0.4225), CGPoint( x: 0.6125, y: 0.36),  CGPoint(  x: 0.575, y: 0.4225))),
			.AddLine(CGPoint( x: 0.735, y: 0.4225)),
			.Close
		]
		let armPath = [PathOperation.RoundedRect(CGRect(x:0.23, y:0.4725,width:0.145,height:0.3), 0.0175)]
		
		return [
			LayerConfiguration( name : "hand", fillColor : UIColor.whiteColor(), path : handPath ),
			LayerConfiguration( name : "arm", fillColor : UIColor.whiteColor(), path : armPath )
		]
	}
}