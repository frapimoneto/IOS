//
//  ViewController.swift
//  Teste
//
//  Created by Francisco on 22/04/21.
//

import UIKit

class FactViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel = FactViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadFacts()
    }

    private func loadFacts() {
        viewModel.fetchFacts { [weak self] in
            self?.tableView.dataSource = self
            self?.tableView.reloadData()
        }
    }

}

extension FactViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FactTableViewCell
        
        let fact = viewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(fact)
        
        return cell
    }
    
    
}
