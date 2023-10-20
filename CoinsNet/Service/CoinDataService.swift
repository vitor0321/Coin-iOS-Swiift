//
//  CoinDataService.swift
//  CoinsNet
//
//  Created by vitor.walcker on 20/10/23.
//

import Foundation

class CoinDataService {
    
    func fetchPrice(coin: String, typeCoin: String, completion: @escaping(Double) -> Void) {
        let urlString = "https://api.coingecko.com/api/v3/simple/price?ids=\(coin)&vs_currencies=\(typeCoin)"
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response , error in
                
                if let error = error {
                    print("Debug: Failed error \(error.localizedDescription)")
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    return
                }
                
                guard httpResponse.statusCode == 200 else {
                    return
                }
                
                guard let data = data else {return}
                guard let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {return}
                guard let value = jsonObject[coin] as? [String: Double] else {return}
                guard let price = value[typeCoin] else {return}
                
                completion(price)
        }.resume()
    }
}
