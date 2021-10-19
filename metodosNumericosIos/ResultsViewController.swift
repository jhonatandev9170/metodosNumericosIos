//
//  ResultsViewController.swift
//  metodosNumericosIos
//
//  Created by Jhonatan Chavez Chavez on 19/10/21.
//

import UIKit
import SpreadsheetView
class ResultsViewController: UIViewController
{
    let numRows=100
    let numColums=5
    let columnWidth=80.0
    let rowWidth=30.0

    @IBOutlet weak var spreadsheetView: SpreadsheetView!

    override func viewDidLoad() {
            super.viewDidLoad()
            spreadsheetView.dataSource = self
        print(self.view.frame.size.width)
        var offsetLeft = (self.view.frame.size.width -  columnWidth*Double(numColums))/2.0;
        if offsetLeft<10 { offsetLeft=0}
        self.spreadsheetView.contentInset = UIEdgeInsets(top: 1.0, left: offsetLeft, bottom: 0.0, right: 0);

        }

}
extension ResultsViewController:SpreadsheetViewDataSource{

    func numberOfColumns(in spreadsheetView: SpreadsheetView) -> Int {
        return numColums
    }

    func numberOfRows(in spreadsheetView: SpreadsheetView) -> Int {
        return numRows
    }

    func spreadsheetView(_ spreadsheetView: SpreadsheetView, widthForColumn column: Int) -> CGFloat {
      return columnWidth
    }

    func spreadsheetView(_ spreadsheetView: SpreadsheetView, heightForRow row: Int) -> CGFloat {
      return rowWidth
    }
    func frozenRows(in spreadsheetView: SpreadsheetView) -> Int {
        return 1
    }}
