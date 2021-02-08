//
//  BigInt.swift
//  TestTask
//
//  Created by Елисей on 06.02.2021.
//

import Foundation

struct BigInt: Hashable, Identifiable {
    var id = UUID()
    var value: String
    
    static func sum(left: String, right: String) -> String {
        let leftCharacterArray = left.map { Int(String($0))! }
        let rightCharacterArray = right.map { Int(String($0))! }
        var l: [Int] = []   // переменная для хранения числа с большим кол-вом разрядов
        var s: [Int] = []   // переменная для хранения числа с меньшим кол-вом разрядов
        
        // определяем какое число имеет большее кол-во разрядов
        if leftCharacterArray.count > rightCharacterArray.count {
            l = leftCharacterArray
            s = rightCharacterArray
        } else  {
            l = rightCharacterArray
            s = leftCharacterArray
        }
        
        var result = [Int](repeating: 0, count: l.count + 1)
        let sCount = s.count
        
        // поразрядно складываем меньшее число с большим
        for i in 0..<sCount {
            result[i] += l.popLast()! + (s.popLast() ?? 0)
            if result[i] > 9 {
                result[i] -= 10
                result[i+1] += 1
            }
        }
        
        // прибавляем оставшиеся разряды большего числа к результату
        for i in sCount..<result.count {
            if l.count != 0 {
                result[i] += l.popLast()!
                if result[i] > 9 {
                    result[i] -= 10
                    result[i+1] += 1
                }
            } else {
                break
            }
        }
        
        var i = result.count - 1
        
        // убераем лишние разряды у результата
        while result[i] == 0 {
            _ = result.popLast()
            i -= 1
        }
        
        return Array(result.reversed()).map{String($0)}.joined(separator: "")
    }
}
