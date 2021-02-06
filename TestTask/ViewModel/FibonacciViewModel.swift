//
//  FibonacciViewModel.swift
//  TestTask
//
//  Created by Елисей on 06.02.2021.
//

import Foundation


class FibonacciViewModel: ViewModelProtocol {
    @Published public private(set) var rowArray: [TableRow] = [TableRow(firstNum: BigInt(value: "0"),
                                                                        secondNum: BigInt(value: "1"),
                                                                        grayColorForNum: .first)]
    var isFirstGray = false
    
    init() {
        generateRows()
    }
    
    public func generateRows() {
        (1...8).forEach { _ in
            let lastRow = rowArray.last ?? TableRow(firstNum: BigInt(value: "0"), secondNum: BigInt(value: "1"), grayColorForNum: .first)
            let first = BigInt.sum(left: lastRow.firstNum.value , right: lastRow.secondNum.value)
            let second = BigInt.sum(left: lastRow.secondNum.value, right: first)
            
            rowArray.append(TableRow(firstNum: BigInt(value: first), secondNum: BigInt(value: second),
                                     grayColorForNum: isFirstGray ? .first : .second))
            isFirstGray.toggle()
        }
    }
    
}
