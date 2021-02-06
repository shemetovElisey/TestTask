//
//  ListView.swift
//  TestTask
//
//  Created by Елисей on 07.02.2021.
//

import SwiftUI

struct ListView<T: ViewModelProtocol>: View {
    @ObservedObject var viewModel: T
    var body: some View {
        List {
            ForEach(viewModel.rowArray) { row in
                row
                    .listRowInsets(EdgeInsets())
                    .onAppear {
                        if viewModel.rowArray.last!.secondNum.value == row.secondNum.value {
                            viewModel.generateRows()
                        }
                    }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(viewModel: FibonacciViewModel())
    }
}
