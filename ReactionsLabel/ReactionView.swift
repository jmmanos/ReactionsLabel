//
//  ReactionView.swift
//  ReactionViewExample
//
//  Created by John on 6/6/16.
//  Copyright © 2016 jmmanos. All rights reserved.
//

import UIKit

@IBDesignable
public class ReactionView: UIView {
	public let reactionType : ReactionType
	
	public init( reactionType : ReactionType ) {
		self.reactionType = reactionType
		
		super.init(frame: .zero)
		
		setup()
	}
	
	public override init(frame: CGRect) {
		self.reactionType = .Like
		
		super.init(frame: frame)
		
		setup()
	}
	
	required public init?(coder aDecoder: NSCoder) {
		self.reactionType = .Like
		
		super.init(coder: aDecoder)
		
		setup()
	}
	
	func setup() {
		let reaction = ReactionType.reaction(reactionType)
		
		backgroundColor = reaction.backgroundColor
		
		for config in reaction.layerConfigurations {
			let layer = CAShapeLayer()
			layer.name = config.name
			layer.fillColor = config.fillColor.CGColor
			layer.strokeColor = config.strokeColor.CGColor
			layer.lineCap = kCALineCapRound
			layer.lineJoin = kCALineJoinRound
			layer.transform = CATransform3DRotate(layer.transform, config.rotation * CGFloat(M_PI)/180, 0, 0, 1)
			
			self.layer.addSublayer(layer)
		}
	}
	
	public override func layoutSubviews() {
		super.layoutSubviews()
		
		/*print("LayoutSubviews - frame: \(frame)")
		
		let animationKeys = layer.animationKeys() ?? []
		
		print("LayoutSubviews - animations:")
		
		for animationKey in animationKeys {
			print("\t- \(animationKey):")
			
			if let animation = layer.animationForKey(animationKey) as? CABasicAnimation {
				print("\t- \(animation.valueFunction):")
			}
			
		}
		
		print("")*/
		
		CATransaction.begin()
		
		if let animation = layer.animationForKey("bounds") {
			CATransaction.setAnimationDuration(animation.duration)
			CATransaction.setAnimationTimingFunction(animation.timingFunction)
			
			
		} else {
			CATransaction.disableActions()
		}
		
		layer.cornerRadius = min(bounds.width, bounds.height)/2
		
		let reaction = ReactionType.reaction(reactionType)
		
		let scale = reaction.scale
		
		let size = min(bounds.width, bounds.height) * scale
		let newOrigin = CGPoint(x: bounds.width/2 - size/2, y: bounds.height/2 - size/2)
		
		let rect = CGRect(origin: newOrigin, size: CGSize(width: size, height: size))
		
		let minX = rect.origin.x
		let minY = rect.origin.y
		let w = rect.width
		let h = rect.height
		
		for config in reaction.layerConfigurations {
			let name = config.name
			let pathOperations = config.path
			
			if let l = layer.sublayers?.filter({ $0.name == name }).first as? CAShapeLayer {
				var currentPath : UIBezierPath = UIBezierPath()
				
				for op in pathOperations {
					switch op {
					case let .Oval(r):
						let origin = CGPoint(x: minX + r.minX*w, y: minY + r.minY*h)
						let size = CGSize(width: r.width*w, height: r.height*h)
						let newRect = CGRect(origin: origin, size: size)
						currentPath = UIBezierPath(ovalInRect: newRect)
					case let .RoundedRect(r, c):
						let origin = CGPoint(x: minX + r.minX*w, y: minY + r.minY*h)
						let size = CGSize(width: r.width*w, height: r.height*h)
						let newRect = CGRect(origin: origin, size: size)
						currentPath = UIBezierPath(roundedRect: newRect, cornerRadius: c*w)
					case let .MoveTo(p):
						let inset = CGPoint(x: minX, y: minY)
						currentPath.moveToPoint(CGPoint(x: inset.x + p.x*w, y: inset.y + p.y*h))
					case let .SetPosition(p):
						l.position = CGPoint(x: minX + p.x*w, y: minY + p.y*h)
					case let .SetLineWidth(lineWidth):
						l.lineWidth = lineWidth * min(w,h)
					case let .AddLine(p):
						currentPath.addLineToPoint(CGPoint(x: minX + p.x*w, y: minY + p.y*h))
					case let .AddCurve(p, cp1, cp2):
						let i = CGPoint(x: minX, y: minY)
						
						currentPath.addCurveToPoint( CGPoint(x: i.x+p.x*w,y: i.y+p.y*h), controlPoint1: CGPoint(x: i.x+cp1.x*w,y: i.y+cp1.y*h), controlPoint2: CGPoint(x: i.x+cp2.x*w,y: i.y+cp2.y*h))
					case .Close:
						currentPath.closePath()
					}
				}
				
				l.path = currentPath.CGPath
			}
			
			//setNeedsDisplay()
		}
		
		CATransaction.commit()
	}
}
