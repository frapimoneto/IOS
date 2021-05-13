//
//  Model_Category.swift
//  Teste
//
//  Created by Francisco on 28/04/21.
//

import Foundation


struct CategoryData: Decodable {
    let categories: [Category]
//    let text: String

    private enum CodingKeys: String, CodingKey {
        case categories = "result"
    }
    
    
}
    struct Category: Decodable {
        let text: String?
        
        private enum CodingKeys: String, CodingKey {
            case text = ""
        }
    }
    
    


