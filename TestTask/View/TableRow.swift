//
//  TableRow.swift
//  TestTask
//
//  Created by Елисей on 06.02.2021.
//

import SwiftUI

struct TableRow: View, Identifiable {
    let id = UUID()
    
    let firstNum: BigInt            // левое число
    let secondNum: BigInt           // правое число
    let grayColorForNum: GrayNum    // фон какого числа нужно окрасить
    
    var body: some View {
        HStack(spacing: 0) {
            Text(firstNum.value)
                .frame(width: (UIScreen.main.bounds.width / 2), height: 100)
                .background(Rectangle().foregroundColor(grayColorForNum == .first ? .gray : .clear))
            
            Text(secondNum.value)
                .frame(width: (UIScreen.main.bounds.width / 2), height: 100)
                .background(Rectangle().foregroundColor(grayColorForNum == .second ? .gray : .clear))
        }
        
    }
    
    enum GrayNum {
        case first
        case second
    }
}

struct TableRow_Previews: PreviewProvider {
    static var previews: some View {
        TableRow(firstNum: BigInt(value: "0"), secondNum: BigInt(value: "1"), grayColorForNum: .first)
    }
}
