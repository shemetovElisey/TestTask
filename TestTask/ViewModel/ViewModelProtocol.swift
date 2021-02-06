//
//  ViewModelProtocol.swift
//  TestTask
//
//  Created by Елисей on 06.02.2021.
//

import Foundation

protocol ViewModelProtocol: ObservableObject {
    var rowArray: [TableRow] { get }
    var isFirstGray: Bool { get }
    func generateRows()
}

