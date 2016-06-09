//
//  Laugh.swift
//  ReactionViewExample
//
//  Created by John on 6/6/16.
//  Copyright © 2016 jmmanos. All rights reserved.
//

import UIKit

public struct LaughReaction : Reaction {
	public var backgroundColor : UIColor {
		return UIColor(red: 69/255, green: 220/255, blue: 95/255, alpha: 1)
	}
	
	public var scale : CGFloat {
		return 0.7
	}
	
	public var layerConfigurations : [LayerConfiguration] {
		let circle = [PathOperation.Oval(CGRect(x:0, y:0,width:1,height:1))]
		let rightEye : [PathOperation] = [
			.MoveTo( CGPoint(x: 0.2, y: 0.27) ),
			.AddLine(CGPoint( x: 0.33, y: 0.34)),
			.AddLine(CGPoint( x: 0.20, y: 0.40)),
			.SetLineWidth(0.04)
		]
		let leftEye : [PathOperation] = [
			.MoveTo( CGPoint(x: 0.8, y: 0.27) ),
			.AddLine(CGPoint( x: 0.67, y: 0.34)),
			.AddLine(CGPoint( x: 0.80, y: 0.40)),
			.SetLineWidth(0.04)
		]
		let tongue : [PathOperation] = [
			.MoveTo(CGPoint(x: 0.7919, y: 0.6493)),
			.AddCurve((CGPoint(x: 0.50, y: 0.83), CGPoint(x: 0.7567, y: 0.7344), CGPoint(x: 0.6777, y: 0.83))),
			.AddCurve((CGPoint(x: 0.2081, y: 0.6493), CGPoint(x: 0.3223, y: 0.83), CGPoint(x: 0.2433, y: 0.7344))),
			.AddCurve((CGPoint(x: 0.50, y: 0.60), CGPoint(x: 0.2639, y: 0.6287), CGPoint(x: 0.3655, y: 0.60))),
			.AddCurve((CGPoint(x: 0.7919, y: 0.6493), CGPoint(x: 0.6345, y: 0.60), CGPoint(x: 0.7361, y: 0.6287))),
			.Close
		]
		let mouth : [PathOperation] = [
			.MoveTo(CGPoint(x: 0.82, y: 0.52)),
			.AddCurve((CGPoint(x: 0.7919, y: 0.6493), CGPoint(x: 0.82, y: 0.52), CGPoint(x: 0.82, y: 0.5813))),
			.AddCurve((CGPoint(x: 0.50, y: 0.60), CGPoint(x: 0.7361, y: 0.6287), CGPoint(x: 0.6345, y: 0.60))),
			.AddCurve((CGPoint(x: 0.2081, y: 0.6493), CGPoint(x: 0.3655, y: 0.60), CGPoint(x: 0.2639, y: 0.6287))),
			.AddCurve((CGPoint(x: 0.18, y: 0.52), CGPoint(x: 0.18, y: 0.5813), CGPoint(x: 0.18, y: 0.52))),
			.AddLine(CGPoint(x: 0.82, y: 0.52)),
			.AddLine(CGPoint(x: 0.82, y: 0.52)),
			.Close
		]
		return [
			LayerConfiguration(name: "circle", fillColor: UIColor(red: 1, green: 0.912, blue: 0, alpha: 1),path: circle),
			LayerConfiguration(name: "leftEye", strokeColor: UIColor.blackColor(), path:leftEye),
			LayerConfiguration(name: "rightEye", strokeColor: UIColor.blackColor(), path:rightEye),
			LayerConfiguration(name: "mouth", fillColor: UIColor.blackColor(), path: mouth),
			LayerConfiguration(name: "tongue", fillColor: UIColor.redColor(), path: tongue)
		]
	}
}