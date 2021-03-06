//
//  FibonacciViewModel.swift
//  TestTask
//
//  Created by Елисей on 06.02.2021.
//

import Foundation


class FibonacciViewModel: ViewModelProtocol {
    @Published public private(set) var rowArray: [(BigInt, BigInt, Bool)] = [(BigInt(value: "0"),
                                                                              BigInt(value: "1"), true)]
    var queue = DispatchQueue(label: "fib-queue", qos: .userInitiated)
    var isFirstGray = false
    var res = [(BigInt, BigInt, Bool)]()
    
    init() {
        generateRows()
    }
    
    public func generateRows() {
        for _ in 1...16 {
            DispatchQueue.main.async {
                let lastRow = self.rowArray.last ?? (BigInt(value: "0"), BigInt(value: "1"), self.isFirstGray)
                let first = BigInt.sum(left: lastRow.0.value, right: lastRow.1.value)
                let second = BigInt.sum(left: lastRow.1.value, right: first)
            
            
                self.rowArray.append((BigInt(value: first),
                                      BigInt(value: second), self.isFirstGray))
                self.isFirstGray.toggle()
            }
        }
    }
    
}
