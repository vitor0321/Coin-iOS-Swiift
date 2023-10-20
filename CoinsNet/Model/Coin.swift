import Foundation

struct Coin: Codable, Identifiable {
    let id: String
    let symbol: String
    let name : String
    let image : String
    let currentPrice: Double
    let marketCapRank: Int
    let high24h: Double
    let low24h: Double
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCapRank = "market_cap_rank"
        case high24h = "high_24h"
        case low24h = "low_24h"
    }
}
