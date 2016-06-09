//
//  Array+Extensions.swift
//  ReactionsLabel
//
//  Created by John on 6/8/16.
//  Copyright © 2016 jmmanos. All rights reserved.
//

import Foundation

extension SequenceType where Generator.Element: Hashable {
	func frequencies() -> [(Generator.Element,Int)] {
		var f : [Generator.Element:Int] = [:]
		for element in self {  f[element] = (f[element] ?? 0) + 1 }
		return f.sort( { $0.1 > $1.1 } )
	}
	
	func diff( new: [Generator.Element] )->(del:[Generator.Element], ins: [Generator.Element], mov: [Generator.Element]) {
		let newSet = Set(new)
		let oldSet = Set(self)
		
		let deletions = oldSet.subtract(newSet)
		let insertions = newSet.subtract(oldSet)
		let moves = oldSet.intersect(newSet)
		
		return (Array(deletions), Array(insertions), Array(moves))
	}
}