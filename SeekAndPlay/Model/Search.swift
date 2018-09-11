//
//  Search.swift
//  SeekAndPlay
//
//  Created by Nicolás Fernández Alarcón on 11-09-18.
//  Copyright © 2018 Nicolás Fernández. All rights reserved.
//

import Foundation
import Alamofire

class Search {
	
	var term = String()
	let limit = 20

	func searchTerm(_ term: String) {
		//Note: URL encoding replaces spaces with the plus (+) character and all characters except the following are encoded: letters, numbers, periods (.), dashes (-), underscores (_), and asterisks (*)
		if let encoded = term.addingPercentEncoding(withAllowedCharacters: .alphanumerics) {
			
			//TODO: save term in database for recentSearches
			
			//TODO: check how to look for a collection entity=music&attribute=albumTerm // CollectionName
			Alamofire.request("https://itunes.apple.com/search?term=\(encoded)&media=music&limit=\(limit)").responseJSON { response in
				print("Request: \(String(describing: response.request))")   // original url request
				print("Response: \(String(describing: response.response))") // http url response
				print("Result: \(response.result)")                         // response serialization result
				

				if let json = response.result.value {
 					print("JSON: \(json)") // serialized json response
					//TODO: trackName
					//TODO: artistName | collectionName
					//collectionId, collectionViewUrl, artworkUrl100,  previewUrl
				}
				
				if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
					print("Data: \(utf8Text)") // original server data as UTF8 string
				}
			}
		} else {
			print("empty encoded term")
		}
	}
	
	//TODO: implement search methods
}
