//
//  SadReaction.swift
//  ReactionsLabel
//
//  Created by John on 6/8/16.
//  Copyright © 2016 jmmanos. All rights reserved.
//


import UIKit

public struct SadReaction : Reaction {
	public var backgroundColor : UIColor {
		return UIColor(red: 255/255, green: 150/255, blue: 0/255, alpha: 1)
	}
	
	public var scale : CGFloat {
		return 0.7
	}
	
	public var layerConfigurations : [LayerConfiguration] {
		let circle = [PathOperation.Oval(CGRect(x:0, y:0,width:1,height:1))]
		let rightEyebrow : [PathOperation] = [
			.SetPosition( CGPoint(x: 0.19, y: 0.415) ),
			.MoveTo( CGPoint(x: 0, y: 0.025) ),
			.AddCurve((CGPoint(x: 0.06, y: 0), CGPoint(x: 0, y: 0.025), CGPoint(x: 0.02, y: 0))),
			.AddCurve((CGPoint(x: 0.12, y: 0.025), CGPoint(x: 0.1, y: 0), CGPoint(x: 0.12, y: 0.025))),
			.SetLineWidth(0.03)
		]
		let leftEyebrow : [PathOperation] = [
			.SetPosition( CGPoint(x: 0.705, y: 0.365) ),
			.MoveTo( CGPoint(x: 0, y: 0.025) ),
			.AddCurve((CGPoint(x: 0.06, y: 0), CGPoint(x: 0, y: 0.025), CGPoint(x: 0.02, y: 0))),
			.AddCurve((CGPoint(x: 0.12, y: 0.025), CGPoint(x: 0.1, y: 0), CGPoint(x: 0.12, y: 0.025))),
			.SetLineWidth(0.03)
		]
		let rightEye = [PathOperation.Oval(CGRect(x:0.22, y:0.475,width:0.12,height:0.13))]
		let leftEye = [PathOperation.Oval(CGRect(x:0.66, y:0.475,width:0.12,height:0.13))]
		let mouth : [PathOperation] = [
			.MoveTo(CGPoint(x: 0.38, y: 0.79)),
			.AddCurve((CGPoint(x: 0.50, y: 0.73), CGPoint(x: 0.38, y: 0.79), CGPoint(x: 0.42, y: 0.73))),
			.AddCurve((CGPoint(x: 0.62, y: 0.79), CGPoint(x: 0.58, y: 0.73), CGPoint(x: 0.62, y: 0.79)))
		]
		let tear : [PathOperation] = [
			.MoveTo(CGPoint(x: 0.785, y: 0.74)),
			.AddCurve((CGPoint(x: 0.71, y: 0.925), CGPoint(x: 0.785, y: 0.74), CGPoint(x: 0.71, y: 0.87))),
			.AddCurve((CGPoint(x: 0.785, y: 1.0), CGPoint(x: 0.71, y: 0.925), CGPoint(x: 0.71, y: 1.0))),
			.AddCurve((CGPoint(x: 0.86, y: 0.925), CGPoint(x: 0.86, y: 1.0), CGPoint(x: 0.86, y: 0.925))),
			.AddCurve((CGPoint(x: 0.785, y: 0.74), CGPoint(x: 0.86, y: 0.87), CGPoint(x: 0.785, y: 0.74))),
			.Close
		]
		return [
			LayerConfiguration(name: "circle", fillColor: UIColor(red: 1, green: 0.912, blue: 0, alpha: 1),path: circle),
			LayerConfiguration(name: "leftEyebrow", strokeColor: UIColor.blackColor(), rotation:25, path:leftEyebrow),
			LayerConfiguration(name: "rightEyebrow", strokeColor: UIColor.blackColor(), rotation:-25, path:rightEyebrow),
			LayerConfiguration(name: "leftEye", fillColor: UIColor.blackColor(), path:leftEye),
			LayerConfiguration(name: "rightEye", fillColor: UIColor.blackColor(), path:rightEye),
			LayerConfiguration(name: "mouth", strokeColor: UIColor.blackColor(), path: mouth),
			LayerConfiguration(name: "tear", fillColor: UIColor.blueColor(), path:tear)
		]
	}
}
