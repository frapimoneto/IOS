//
//  Model_Category.swift
//  Teste
//
//  Created by Francisco on 28/04/21.
//

import Foundation


struct CategoryData: Decodable {
//    let facts: [Fact]
    let text: String

    private enum CodingKeys: String, CodingKey {
        case text = ""
    }
}

