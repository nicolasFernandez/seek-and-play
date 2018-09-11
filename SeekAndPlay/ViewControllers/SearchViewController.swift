//
//  SearchViewController.swift
//  SeekAndPlay
//
//  Created by Nicolás Fernández Alarcón on 08-09-18.
//  Copyright © 2018 Nicolás Fernández. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
	
	@IBOutlet weak var emptyView: UIView!
	@IBOutlet weak var recentSearchTableView: UITableView!
	@IBOutlet weak var searchBar: UISearchBar!
	
	var recentSearches = [History]() {
		didSet {
			// debug print statement
			recentSearchTableView.isHidden = recentSearches.count < 1
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		//Tabla de busquedas recientes inicia escondida para mostrar emptyView
		recentSearchTableView.isHidden = true
		
		//TODO: fill recentSearches from database
		//TODO: hide recentSearchTableView based on recentSearches.count
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
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		if section == 0 {
			return "Búsquedas recientes"
		}
		
		return ""
	}
	
}
