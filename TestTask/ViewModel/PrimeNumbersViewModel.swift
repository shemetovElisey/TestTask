//
//  PrimeNumbersViewModel.swift
//  TestTask
//
//  Created by Елисей on 07.02.2021.
//

import Foundation

class PrimeNumbersViewModel: ViewModelProtocol {
    @Published public private(set) var rowArray: [(BigInt, BigInt, Bool)] = []
    var queue = DispatchQueue(label: "prime-queue", qos: .userInitiated)
    var isFirstGray = true
    
    var n = 16
    var p = [2, 3]
    var lc = [2, 3]
    
    
    
    init() {
        generateRows()
    }
    
    func generateRows() {
        while p.count < n {
            var candidate = p.last! + 2
            var i = 0
            while i < p.count {
                while lc[i] < candidate{
                    lc[i] += self.p[i]
                }
                if lc[i] == candidate {
                    candidate += 2
                    i = 0
                }
                i += 1
            }
            p.append(candidate)
            lc.append(candidate)
        }
        
        
            for i in stride(from: self.rowArray.count*2, to: self.p.count-1, by: 2) {
                DispatchQueue.main.async {
                    self.rowArray.append((BigInt(value: String(self.p[i])),
                                          BigInt(value: String(self.p[i+1])), self.isFirstGray))
                    self.isFirstGray.toggle()
                }
            }
            n += 16
    }
}
