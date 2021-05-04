//
//  Model.swift
//  Teste
//
//  Created by Francisco on 26/04/21.
//

import Foundation

struct FactsData: Decodable {
    let facts: [Fact]
//    let category: [String]?
    
        private enum CodingKeys: String, CodingKey {
            case facts = "result"
        }
    
}

//struct Facts: Decodable {
//    let facts: [Fact]
//}


struct Fact: Decodable {
    //    let facts: Fact
        let category: [String]?
        let id: String?
        let icon: String?
        let url: String?
        let fact: String?
        
        private enum CodingKeys: String, CodingKey {
            case category = "categories"
    //        case id
            case icon = "icon_url"
            case id = "id"
            case url = "url"
            case fact = "value"
        }
}
