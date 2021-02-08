//
//  TableRow.swift
//  TestTask
//
//  Created by Елисей on 06.02.2021.
//

import SwiftUI

struct TableRow: View {
    let firstNum: BigInt       // левое число
    let secondNum: BigInt      // правое число
    var isFirstGray: Bool      // фон какого числа нужно окрасить
    
    var body: some View {
        HStack(spacing: 0) {
            Text(firstNum.value)
                .frame(width: (UIScreen.main.bounds.width / 2), height: 100)
                .background(Rectangle().foregroundColor(isFirstGray ? .gray : .clear))
            
            Text(secondNum.value)
                .frame(width: (UIScreen.main.bounds.width / 2), height: 100)
                .background(Rectangle().foregroundColor(!isFirstGray ? .gray : .clear))
        }
        
    }
    
    enum GrayNum {
        case first
        case second
    }
}

struct TableRow_Previews: PreviewProvider {
    static var previews: some View {
        TableRow(firstNum: BigInt(value: "0"), secondNum: BigInt(value: "1"), isFirstGray: true)
    }
}
