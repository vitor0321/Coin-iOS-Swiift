import Foundation

class CoinViewModel: ObservableObject{
    @Published var coins = [Coin]()
    
    private let service = CoinDataService()
    
    init() {
        fetchCoin()
    }
    
    func fetchCoin() {
        service.fetchCoins(completion: { coins in
            DispatchQueue.main.async {
                self.coins = coins
            }
        })
    }
}
