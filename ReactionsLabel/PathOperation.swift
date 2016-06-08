//
//  PathOperation.swift
//  ReactionsLabel
//
//  Created by John on 6/7/16.
//  Copyright © 2016 jmmanos. All rights reserved.
//

import UIKit

public enum PathOperation {
	case MoveTo( CGPoint )
	case AddLine( CGPoint )
	case AddCurve( CGPoint, CGPoint, CGPoint )
	case Close
	case RoundedRect( CGRect , CGFloat)
	case Oval( CGRect )
	case SetPosition( CGPoint )
	case SetLineWidth( CGFloat )
}
