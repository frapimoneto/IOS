//
//  ApiService.swift
//  Teste
//
//  Created by Francisco on 22/04/21.
//

import Foundation

class ApiService {
    private var dataTask: URLSessionDataTask?
    
    func getChuckNorrisFacts(completion: @escaping (Result<FactsData, Error>) -> Void){
        let chuckNorrisURL = ""
        
        guard let url = URL(string: chuckNorrisURL) else {return}
        
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(.failure(error))
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("Empty Data")
                return
            }
            
            do {
               let decoder = JSONDecoder()
                let jsonData = try decoder.decode(FactsData.self, from: <#T##Data#>)
                
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            } catch let error {
                completion(.failure(error))
            }
        }
        dataTask?.resume()
    }
}
