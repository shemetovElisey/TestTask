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
            ForEach(viewModel.rowArray, id: \.0) { row in
                TableRow(firstNum: row.0, secondNum: row.1, isFirstGray: row.2)
                    .listRowInsets(EdgeInsets())
                    .onAppear {
                        if viewModel.rowArray.last!.1 == row.1 {
                            viewModel.queue.async {
                                viewModel.generateRows()
                            }
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


