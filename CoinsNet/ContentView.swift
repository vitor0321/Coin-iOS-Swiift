import SwiftUI
import URLImage

struct ContentView: View {
    
    @StateObject var viewModel = CoinViewModel()
    
    var body: some View {
        Text("Coins")
            .fontWeight(.bold)
            .font(.title)
        
        List {
            ForEach(viewModel.coins.indices, id: \.self) { index in
                let coin = viewModel.coins[index]
                VStack{
                    HStack(spacing: 12) {
                        Text("\(coin.marketCapRank)")
                            .foregroundStyle(.gray)
                        
                        AsyncImage(url: URL(string: coin.image)) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30, height: 30)
                            case .failure:
                                Image(systemName: "xmark.circle.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.red)
                            @unknown default: Text("")
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(coin.name)
                                .fontWeight(.semibold)
                            
                            Text(coin.symbol.uppercased())
                        }
                        
                        Spacer()
                        
                        Text("Now: "+formatPrice(coin.currentPrice))
                    }
                    
                    Text("24h price")
                        .fontWeight(.semibold)
                    
                    HStack{
                        Text("Low: "+formatPrice(coin.low24h))
                        Spacer()
                        Text("High: "+formatPrice(coin.high24h))
                    }
                    
                }
                .font(.footnote)
            }
        }
        .overlay{
            if let error = viewModel.errorMessage {
                Text(error)
            }
        }
    }
}

func formatPrice(_ price: Double) -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.minimumFractionDigits = 2
    numberFormatter.maximumFractionDigits = 2
    numberFormatter.numberStyle = .currency
    numberFormatter.locale = Locale(identifier: "en_US")
    return numberFormatter.string(from: NSNumber(value: price)) ?? ""
}

#Preview {
    ContentView()
}
