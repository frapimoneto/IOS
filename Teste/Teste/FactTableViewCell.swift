//
//  FactTableViewCell.swift
//  Teste
//
//  Created by Francisco on 03/05/21.
//

import UIKit

class FactTableViewCell: UITableViewCell {

    @IBOutlet weak var factText: UILabel!
    @IBOutlet weak var categoryFact: UILabel!
    
    func setCellWithValuesOf(_ fact:Fact) {
                updateUI(fact: fact.fact, category: fact.category)
            }
    
    private func updateUI(fact: String?, category: [String]?) {
                
                self.factText.text = fact
//                self.categoryFact.text = category 
                
            }
}
