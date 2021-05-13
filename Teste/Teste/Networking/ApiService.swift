//
//  ApiService.swift
//  Teste
//
//  Created by Francisco on 22/04/21.
//

import Foundation
import Alamofire

class ApiService {
    private var dataTask: FactsData?
    
    func getChuckNorrisFacts(query: String,completion: @escaping (Result<FactsData, Error>) -> Void){
        let chuckNorrisURL = "https://api.chucknorris.io/jokes/search?query=" + query
        
        AF.request(chuckNorrisURL)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseDecodable(of:FactsData.self){ response in
                switch response.result {
                case.success(let facts):
//                    self.dataTask = facts
                    completion(.success(facts));
                    
                case let .failure(error):
//                    print(error)
                    completion(.failure(error))
                }
            }

    }
    
}
