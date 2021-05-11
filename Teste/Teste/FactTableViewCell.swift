//
//  FactTableViewCell.swift
//  Teste
//
//  Created by Francisco on 03/05/21.
//

import UIKit
protocol FactTableViewCellDelegate: AnyObject {
    func share(fact: Fact)
}

class FactTableViewCell: UITableViewCell {
    
    @IBOutlet weak var factText: UILabel!
    @IBOutlet weak var categoryFact: UILabel!
    
    var fact: Fact?
    weak var delegate: FactTableViewCellDelegate?
    
    
    @IBAction func shareLink(_ sender: Any) {
        if let fact = fact {
            delegate?.share(fact: fact)
        }
    }
    
    
    func setCellWithValuesOf(_ fact:Fact) {
        updateUI(fact: fact.fact, category: fact.category)
        self.fact = fact
    }
    
    private func updateUI(fact: String?, category: [String]?) {
        self.factText.text = fact
        self.categoryFact.text = category?.first?.uppercased() ?? "UNCATEGORIZED"
    }
}
