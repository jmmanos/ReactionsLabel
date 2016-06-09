//
//  AngryReaction.swift
//  ReactionsLabel
//
//  Created by John on 6/8/16.
//  Copyright © 2016 jmmanos. All rights reserved.
//

import UIKit

public struct AngryReaction : Reaction {
	public var backgroundColor : UIColor {
		return UIColor(red: 255/255, green: 55/255, blue: 35/255, alpha: 1)
	}
	
	public var scale : CGFloat {
		return 0.7
	}
	
	public var layerConfigurations : [LayerConfiguration] {
		let circle = [PathOperation.Oval(CGRect(x:0, y:0,width:1,height:1))]
		let rightEyebrow : [PathOperation] = [
			.MoveTo( CGPoint(x: 0.14, y: 0.535) ),
			.AddCurve((CGPoint(x: 0.425, y: 0.6), CGPoint(x: 0.14, y: 0.535), CGPoint(x: 0.22, y: 0.6))),
			.SetLineWidth(0.03)
		]
		let leftEyebrow : [PathOperation] = [
			.MoveTo( CGPoint(x: 0.575, y: 0.6) ),
			.AddCurve((CGPoint(x: 0.86, y: 0.53), CGPoint(x: 0.78, y: 0.60), CGPoint(x: 0.86, y: 0.535))),
			.SetLineWidth(0.03)
		]
		let rightEye = [PathOperation.Oval(CGRect(x:0.24, y:0.585,width:0.09,height:0.09))]
		let leftEye = [PathOperation.Oval(CGRect(x:0.67, y:0.585,width:0.09,height:0.09))]
		
		let mouth : [PathOperation] = [
			.MoveTo(CGPoint(x: 0.345, y: 0.805)),
			.AddCurve((CGPoint(x: 0.50, y: 0.77),CGPoint(x: 0.345, y: 0.805), CGPoint(x: 0.34, y: 0.77))),
			.AddCurve((CGPoint(x: 0.655, y: 0.805), CGPoint(x: 0.66, y: 0.77), CGPoint(x: 0.655, y: 0.805))),
			.AddCurve((CGPoint(x: 0.50, y: 0.83), CGPoint(x: 0.655, y: 0.805), CGPoint(x: 0.66, y: 0.83))),
			.AddCurve((CGPoint(x: 0.345, y: 0.805), CGPoint(x: 0.34, y: 0.83), CGPoint(x: 0.345, y: 0.805))),
			.Close
		]
		return [
			LayerConfiguration(name: "circle", fillColor: UIColor(red: 1, green: 0.912, blue: 0, alpha: 1),path: circle),
			LayerConfiguration(name: "leftEyebrow", strokeColor: UIColor.blackColor(), path:leftEyebrow),
			LayerConfiguration(name: "rightEyebrow", strokeColor: UIColor.blackColor(), path:rightEyebrow),
			LayerConfiguration(name: "leftEye", fillColor: UIColor.blackColor(), path:leftEye),
			LayerConfiguration(name: "rightEye", fillColor: UIColor.blackColor(), path:rightEye),
			LayerConfiguration(name: "mouth", fillColor: UIColor.blackColor(), path: mouth)
		]
	}
}
