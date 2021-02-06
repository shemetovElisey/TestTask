//
//  PrimeNumbersViewModel.swift
//  TestTask
//
//  Created by Елисей on 07.02.2021.
//

import Foundation

class PrimeNumbersViewModel: ViewModelProtocol {
    @Published public private(set) var rowArray: [TableRow] = []
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
                    lc[i] += p[i]
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
        
        for i in stride(from: rowArray.count*2, to: p.count-1, by: 2) {
            rowArray.append(TableRow(firstNum: BigInt(value: String(p[i])),
                                     secondNum: BigInt(value: String(p[i+1])),
                                     grayColorForNum: isFirstGray ? .first : .second))
            isFirstGray.toggle()
        }
        n += 16
    }
}
