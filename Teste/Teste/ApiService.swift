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
    
    func getChuckNorrisFacts(completion: @escaping (Result<FactsData, Error>) -> Void){
        let chuckNorrisURL = "https://api.chucknorris.io/jokes/search?query=code"
        
//        AF.request(chuckNorrisURL).responseDecodable(of:FactsData.self){ response in
//            switch response.result {
//            case .success(let facts): print(facts)
//            case .failure(let error): print(error)
//            }
//        }
        
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

//        guard let url = URL(string: chuckNorrisURL) else {return}
//
//        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
//
//            if let error = error {
//                completion(.failure(error))
//                print("DataTask error: \(error.localizedDescription)")
//                return
//            }
//
//            guard let response = response as? HTTPURLResponse else {
//                print("Empty Response")
//                return
//            }
//            print("Response status code: \(response.statusCode)")
//
//            guard let data = data else {
//                print("Empty Data")
//                return
//            }
//
//            do {
//               let decoder = JSONDecoder()
//                let jsonData = try decoder.decode(FactsData.self, from: data)
//
//                DispatchQueue.main.async {
//                    completion(.success(jsonData))
//                }
//            } catch let error {
//                completion(.failure(error))
//            }
//        }
//    return
    }
    
}
