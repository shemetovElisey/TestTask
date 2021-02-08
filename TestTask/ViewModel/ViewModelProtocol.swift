//
//  ViewModelProtocol.swift
//  TestTask
//
//  Created by Елисей on 06.02.2021.
//

import Foundation

protocol ViewModelProtocol: ObservableObject {
    var rowArray: [(BigInt, BigInt, Bool)] { get }
    var queue: DispatchQueue { get }
    var isFirstGray: Bool { get }
    func generateRows()
}

