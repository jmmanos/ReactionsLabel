//
//  ReactionsLabel.swift
//  ReactionsLabel
//
//  Created by John on 6/7/16.
//  Copyright © 2016 jmmanos. All rights reserved.
//

import UIKit

@IBDesignable
public class ReactionsLabel: UIView {
	private let previewItemsLimit = 6
	private let reactionsSpacing : CGFloat = -3
	private let reactionsScale : CGFloat = 1.1
	private let frameInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
	private let fontSize : CGFloat = 18
	private lazy var lineHeight : CGFloat = UIFont.systemFontOfSize(self.fontSize).lineHeight
	
	public var reactionsHeight : NSLayoutConstraint!
	private weak var label : UILabel!
	private weak var labelLeading : NSLayoutConstraint!
	
	private var reactionViews : [ReactionType: (ReactionView, NSLayoutConstraint, NSLayoutConstraint)] = [:]
	private var _reactions : [(ReactionType , Int)] = []
	
	override public init(frame: CGRect) {
		super.init(frame: frame)
		setup()
	}
	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setup()
	}
	
	func labelLeadingConstant() -> CGFloat {
		return leadingConstant(reactionViews.count) + 7
	}
	
	func leadingConstant( index : Int ) -> CGFloat {
		let diameter = (lineHeight + 0) * reactionsScale
		return frameInsets.left + (diameter + reactionsSpacing) * CGFloat(index)
	}
	
	func setup() {
		let label = newLabel()
		label.alpha = 0
		addSubview(label)
		
		self.label = label
		
		label.centerYAnchor.constraintEqualToAnchor(centerYAnchor, constant: 0).active = true
		let leading = label.leadingAnchor.constraintEqualToAnchor(leadingAnchor, constant: 0)
		leading.active = true
		labelLeading = leading
	}
	
	func textForReactions( count : Int ) -> String {
		switch count {
		case 0: return label?.text ?? "Reaction"
		case 1: return "1 Reaction"
		default: return "\(count) Reactions"
		}
	}
	
	func newLabel() -> UILabel {
		let label = UILabel()
		label.text = textForReactions(0)
		label.font = UIFont.systemFontOfSize(fontSize)
		label.textColor = UIColor(white: 0.9, alpha: 0.9)
		label.translatesAutoresizingMaskIntoConstraints = false
		
		return label
	}
	
	func findMostCommon( reactions : [ReactionType] ) -> [(ReactionType , Int)] {
		return reactions.frequencies()
	}
	
	func addReaction( index: Int, reaction: ReactionType) -> (() -> ()) {
		let view = ReactionView( reactionType: reaction)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.alpha = 0
		view.layer.zPosition = 10 - CGFloat(index)
		view.transform = CGAffineTransformMakeScale(0.8, 0.8)
		
		addSubview(view)
		
		let centerY = view.centerYAnchor.constraintEqualToAnchor(centerYAnchor, constant: 25)
		let leading = view.leadingAnchor.constraintEqualToAnchor(leadingAnchor, constant: leadingConstant(index))
		view.widthAnchor.constraintEqualToAnchor(view.heightAnchor, constant: 0).active = true
		view.heightAnchor.constraintEqualToConstant(lineHeight * reactionsScale).active = true
		centerY.active = true
		leading.active = true
		
		reactionViews[reaction] = (view, centerY, leading)
		
		return {
			view.transform = CGAffineTransformMakeScale(1, 1)
			view.alpha = 1.0
			centerY.constant = 0
		}
	}
	
	func removeReaction( index: Int, reaction: ReactionType) -> (() -> (), () -> ()) {
		guard let (view, centerY, _) = reactionViews[reaction] else { return ({}, {}) }
		
		reactionViews.removeValueForKey(reaction)
		
		return ({
			view.transform = CGAffineTransformMakeScale(0.8, 0.8)
			view.alpha = 0.0
			centerY.constant = -25
			}, {
				view.hidden = true
				view.removeFromSuperview()
		})
	}
	
	func moveReaction( fromIndex: Int, toIndex: Int, reaction: ReactionType) -> (() -> ()) {
		guard let (view, _, leading) = reactionViews[reaction] else { return {} }
		let constant = leadingConstant(toIndex)
		view.layer.zPosition = 10 - CGFloat(toIndex)
		return {
			leading.constant = constant
		}
	}
	
	func setReactions( loadedReactions : [ReactionType] ) {
		let newPopular = Array(findMostCommon( loadedReactions ).prefix(previewItemsLimit))
		let oldPopular = Array(_reactions.prefix(previewItemsLimit))
		
		let newReactions = Array(newPopular.map { $0.0 } .prefix(previewItemsLimit))
		let oldReactions = Array(oldPopular.map { $0.0 } .prefix(previewItemsLimit))
		
		let (del, ins, mov) = oldReactions.diff(newReactions)
		
		// pending animations
		var pending: [(Void->Void)] = []
		var completion: [(Void->Void)] = []
		
		for d in del {
			let index = _reactions.indexOf { $0.0 == d }
			let (anim, comp) = removeReaction(index!, reaction: d)
			pending.append(anim)
			completion.append(comp)
		}
		
		for i in ins {
			let index = newReactions.indexOf(i)
			pending.append( addReaction(index!, reaction: i) )
		}
		
		for m in mov {
			let to = newReactions.indexOf(m)
			let from = _reactions.indexOf { $0.0.rawValue == m.rawValue }
			pending.append( moveReaction(from!, toIndex: to!, reaction: m) )
		}
		
		_reactions = newPopular
		
		// setup label
		let updateLabel = !newReactions.isEmpty
		let showLabel = oldReactions.isEmpty && !newReactions.isEmpty
		
		if updateLabel {
			label?.text = textForReactions(loadedReactions.count)
		}
		
		// possible label updates
		let finalAlpha : CGFloat = showLabel || updateLabel ? 1.0 : 0.0
		let finalHeight : CGFloat = showLabel || updateLabel ? lineHeight * reactionsScale: 0.0
		let leadingConstant = updateLabel ? labelLeadingConstant() : labelLeading?.constant ?? 0
		
		if showLabel {
			self.labelLeading?.constant = leadingConstant
		}
		
		layoutIfNeeded()
		
		UIView.animateWithDuration(0.7, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: [], animations: { [weak self] in
			pending.forEach { $0() }
			self?.reactionsHeight?.constant = finalHeight
			self?.label?.alpha = finalAlpha
			self?.labelLeading?.constant = leadingConstant
			self?.superview?.layoutIfNeeded()
			self?.invalidateIntrinsicContentSize()
			}, completion: { fin in
				//self.setNeedsDisplay()
				completion.forEach { $0() }
		})
	}
	
	override public func intrinsicContentSize() -> CGSize {
		let width : CGFloat = labelLeading.constant + label.bounds.width + frameInsets.left + frameInsets.right
		return CGSize(width: width, height: lineHeight * reactionsScale)
	}
}

