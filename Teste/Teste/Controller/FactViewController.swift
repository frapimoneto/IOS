//
//  ViewController.swift
//  Teste
//
//  Created by Francisco on 22/04/21.
//

import UIKit

class FactViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func searchTerm(_ sender: Any) {
        performSegue(withIdentifier: "showSearchPage", sender: self)
    }
    
    var term = ""
    
    
    private var viewModel = FactViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.layer.borderWidth = 2
        tableView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        
        navigationItem.title = "Home Page"
        
        loadFacts()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? SearchViewController {
            controller.delegate = self
        }
    }

    private func loadFacts() {
        viewModel.fetchFacts(term: term) { [weak self] in
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
        
        cell.delegate = self
        
        let categorylabel = cell.categoryFact.layer
        
        let fact = viewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(fact)
//        cell.contentView.layer.borderWidth = 2
        cell.layer.borderWidth = 5
        cell.layer.borderColor = (UIColor.white).cgColor
        cell.layer.cornerRadius = 10
//        cell.factText.font = UIFont.systemFont(ofSize: 27.0)
        
        if fact.fact!.count > 80 {
            cell.factText.font = UIFont.systemFont(ofSize: 20.0)
        } else {
            cell.factText.font = UIFont.systemFont(ofSize: 25.0)
        }
        
        categorylabel.borderWidth = 1
        categorylabel.cornerRadius = 5
        categorylabel.borderColor = (UIColor.systemBlue).cgColor
        categorylabel.backgroundColor = (UIColor.systemBlue).cgColor
        
        return cell
    }
    

    
}

extension FactViewController: FactTableViewCellDelegate {
    func share(fact: Fact) {
        guard let url = URL(string: fact.url ?? "") else {return}
        let activityVc = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        activityVc.popoverPresentationController?.sourceView = self.view

        self.present(activityVc, animated: true, completion: nil)
        
//        performSegue(withIdentifier: "showSearchPage", sender: self)
    }
}

extension FactViewController: SearchViewControllerDelegate {
    func search(text: String) {
        term = text
        loadFacts()
    }
    
    
}
