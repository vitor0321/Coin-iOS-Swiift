//
//  CoinViewModel.swift
//  CoinsNet
//
//  Created by vitor.walcker on 18/10/23.
//

import Foundation

class CoinViewModel: ObservableObject{
    @Published var coin = ""
    @Published var price = ""
    @Published var errorMessage: String?
    
    private let service = CoinDataService()
    
    init() {
        fetchPrice(coin: "bitcoin", typeCoin: "usd")
    }
    
    func fetchPrice(coin: String, typeCoin: String) {
        service.fetchPrice(coin: coin, typeCoin: typeCoin) { result in
            DispatchQueue.main.async {
                self.price = "$\(result)"
                self.coin = coin
            }
        }
    }
}
