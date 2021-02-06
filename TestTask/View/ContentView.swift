//
//  ContentView.swift
//  TestTask
//
//  Created by Елисей on 06.02.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var pViewModel = PrimeNumbersViewModel()
    @ObservedObject var fViewModel = FibonacciViewModel()
    
    var body: some View {
        TabView {
            ListView(viewModel: pViewModel)
                .tabItem {
                    Image(systemName: "sum")
                    Text("Prime numbers")
                }
            
            ListView(viewModel: fViewModel)
                .tabItem {
                    Image(systemName: "function")
                    Text("Fibonacci numbers")
                }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
