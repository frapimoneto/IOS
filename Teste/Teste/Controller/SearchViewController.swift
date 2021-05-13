//
//  SearchViewController.swift
//  Teste
//
//  Created by Francisco on 11/05/21.
//

import UIKit
protocol SearchViewControllerDelegate: AnyObject {
    func search(text: String)
}



class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    weak var delegate: SearchViewControllerDelegate?
    
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
    }
    
    
    @IBAction func search(_ sender: Any) {
        guard let textSearchBar = searchBar.text else {
            return
        }
        
        delegate?.search(text: textSearchBar)
        navigationController?.popViewController(animated: true)
    }
    
}
