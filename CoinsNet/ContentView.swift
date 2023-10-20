//
//  ContentView.swift
//  CoinsNet
//
//  Created by vitor.walcker on 18/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = CoinViewModel()
    
    var body: some View {
        VStack {
            if let errorMessage = viewModel.errorMessage{
                Text(errorMessage)
            } else{
                Text("\(viewModel.coin): \(viewModel.price)")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
