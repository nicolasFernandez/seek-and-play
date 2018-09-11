//
//  SearchViewController.swift
//  SeekAndPlay
//
//  Created by Nicolás Fernández Alarcón on 08-09-18.
//  Copyright © 2018 Nicolás Fernández. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	
	@IBOutlet weak var recentSearchTableView: UITableView!
	@IBOutlet weak var emptyTableView: UIView!
	
	var recentSearches = [History]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	//MARK: UITableViewDataSource
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return recentSearches.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let tableViewCell = UITableViewCell(style: .default, reuseIdentifier: "HistoryCell")
		
		let recentSearch = recentSearches[indexPath.row]
		tableViewCell.textLabel?.text = recentSearch.term
		
		return tableViewCell
	}
	
}
