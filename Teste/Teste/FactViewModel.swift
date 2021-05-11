//
//  FactViewModel.swift
//  Teste
//
//  Created by Francisco on 27/04/21.
//

import Foundation

class FactViewModel {
    
    private var apiService = ApiService()
    private var facts = [Fact]()
    
    func fetchFacts(completion: @escaping () -> ()) {
        
        apiService.getChuckNorrisFacts { [weak self] (dataTask) in
            
            switch dataTask {
            case .success(let listOf):
                self?.facts = listOf.facts
                completion()
            case .failure(let error):
                print("Error processing json data: \(error)")
            }
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        if facts.count != 0 {
            return facts.count
        }
        return 0
    }
    
    func share(indexPath: Int) -> String {
        return facts[indexPath].url!
    }
    
    func cellForRowAt (indexPath: IndexPath) -> Fact {
        return facts[indexPath.row]
    }
}
