//
//  ShockedReaction.swift
//  ReactionsLabel
//
//  Created by John on 6/8/16.
//  Copyright © 2016 jmmanos. All rights reserved.
//

import UIKit

public struct ShockedReaction : Reaction {
	public var backgroundColor : UIColor {
		return UIColor(red: 255/255, green: 207/255, blue: 1/255, alpha: 1)
	}
	
	public var scale : CGFloat {
		return 0.7
	}
	
	public var layerConfigurations : [LayerConfiguration] {
		let circle = [PathOperation.Oval(CGRect(x:0, y:0,width:1,height:1))]
		let rightEyebrow : [PathOperation] = [
			.SetPosition( CGPoint(x: 0.21, y: 0.125) ),
			.MoveTo( CGPoint(x: 0, y: 0.025) ),
			.AddCurve((CGPoint(x: 0.06, y: 0), CGPoint(x: 0, y: 0.025), CGPoint(x: 0.02, y: 0))),
			.AddCurve((CGPoint(x: 0.12, y: 0.025), CGPoint(x: 0.1, y: 0), CGPoint(x: 0.12, y: 0.025))),
			.SetLineWidth(0.03)
		]
		let leftEyebrow : [PathOperation] = [
			.SetPosition( CGPoint(x: 0.675, y: 0.105) ),
			.MoveTo( CGPoint(x: 0, y: 0.025) ),
			.AddCurve((CGPoint(x: 0.06, y: 0), CGPoint(x: 0, y: 0.025), CGPoint(x: 0.02, y: 0))),
			.AddCurve((CGPoint(x: 0.12, y: 0.025), CGPoint(x: 0.1, y: 0), CGPoint(x: 0.12, y: 0.025))),
			.SetLineWidth(0.03)
		]
		let rightEye : [PathOperation] = [
			.Oval(CGRect(x:0, y:0,width:0.14,height:0.2)),
			.SetPosition( CGPoint(x: 0.2114, y: 0.2655) )
		]
		let leftEye : [PathOperation] = [
			.Oval(CGRect(x:0, y:0,width:0.14,height:0.2)),
			.SetPosition( CGPoint(x: 0.65, y: 0.285) )
		]
		let mouth = [PathOperation.Oval(CGRect(x:0.36, y:0.5,width:0.28,height:0.39))]
		return [
			LayerConfiguration(name: "circle", fillColor: UIColor(red: 1, green: 0.912, blue: 0, alpha: 1),path: circle),
			LayerConfiguration(name: "leftEyebrow", strokeColor: UIColor.blackColor(), rotation:9, path:leftEyebrow),
			LayerConfiguration(name: "rightEyebrow", strokeColor: UIColor.blackColor(), rotation:-11, path:rightEyebrow),
			LayerConfiguration(name: "leftEye", fillColor: UIColor.blackColor(), rotation: -8, path:leftEye),
			LayerConfiguration(name: "rightEye", fillColor: UIColor.blackColor(), rotation: 8, path:rightEye),
			LayerConfiguration(name: "mouth", fillColor: UIColor.blackColor(), path: mouth)
		]
	}
}
