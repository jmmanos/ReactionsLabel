//
//  ReactionType.swift
//  ReactionViewExample
//
//  Created by John on 6/6/16.
//  Copyright © 2016 jmmanos. All rights reserved.
//

import UIKit

public protocol Reaction {
	var scale : CGFloat { get }
	var backgroundColor : UIColor { get }
	var layerConfigurations : [LayerConfiguration] { get }
}

public enum ReactionType : UInt8 {
	case Like = 0
	case Love
	case Laugh
	case Shocked
	case Sad
	case Angry
}

extension ReactionType {
	static public func reaction( type : ReactionType ) -> Reaction {
		switch type {
		case .Like: return LikeReaction()
		case .Love: return LoveReaction()
		case .Laugh: return LaughReaction()
		case .Shocked: return ShockedReaction()
		case .Sad: return SadReaction()
		case .Angry: return AngryReaction()
		}
	}
}