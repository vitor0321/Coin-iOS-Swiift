import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = CoinViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.coins){ coin in
                Text(coin.name)
            }
        }
    }
}

#Preview {
    ContentView()
}
