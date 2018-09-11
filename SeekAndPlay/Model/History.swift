//
//  History.swift
//  SeekAndPlay
//
//  Created by Nicolás Fernández Alarcón on 11-09-18.
//  Copyright © 2018 Nicolás Fernández. All rights reserved.
//

import Foundation

struct History {
	
	var identifier: Int
	var term: String? = nil
	
	static var identifierFactory = 0
	
	static func getUniqueIdentifier() -> Int {
		identifierFactory += 1
		return identifierFactory
	}
	
	init() {
		self.identifier = History.getUniqueIdentifier()
	}
}
