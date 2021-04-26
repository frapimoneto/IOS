//
//  Model.swift
//  Teste
//
//  Created by Francisco on 26/04/21.
//

import Foundation

struct FactsData: Decodable {
    let facts: [Fact]
    
    private enum CodingKeys: String, CodingKey {
        case facts = "results"
    }
}

//{"categories":[],"created_at":"2020-01-05 13:42:23.880601","icon_url":"https://assets.chucknorris.host/img/avatar/chuck-norris.png","id":"lpPw7f8XSEKHiJQBAy_Jmg","updated_at":"2020-01-05 13:42:23.880601","url":"https://api.chucknorris.io/jokes/lpPw7f8XSEKHiJQBAy_Jmg","value":"Chuck Norris is callin' you pinhead!"}


struct Fact: Decodable {
    let category: String?
    let icon: String?
    let id: String?
    let url: String?
    let fact: String?
    
    private enum CodingKeys: string, CodingKey {
        case
    }
}
