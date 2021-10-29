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
    let cellHeight=25.0
    var dataLabel:[String]=[]
    var data:[DataModel]=[]
    var resultLabel:[String] = []
    var result:[Double] = []

    var cellWidth: Double {
        return self.view.frame.size.width/5.0    }

    @IBOutlet weak var spreadsheetView: SpreadsheetView!

    override func viewDidLoad() {
        super.viewDidLoad()
        spreadsheetView.dataSource = self
        spreadsheetView.register(ResultCell.self, forCellWithReuseIdentifier: ResultCell.identifier)

        }

    @IBAction func ExportButton(_ sender: Any) {
        let fileName = "header.csv"
        let path = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName)
        let csvString = Funcs.toString(dataLabel: dataLabel, data: data,resultLabel: resultLabel,result: result)
         do {
             try csvString.write(to: path!,atomically: true,encoding: .utf8)
             let export = UIActivityViewController(activityItems: [path as Any], applicationActivities: nil)
             self.present(export,animated: true,completion: nil)
         } catch {
             print("error creating file")
         }
    }
}

extension ResultsViewController:SpreadsheetViewDataSource{
    
    func spreadsheetView(_ spreadsheetView: SpreadsheetView, cellForItemAt indexPath: IndexPath) -> Cell? {
        let cell = spreadsheetView.dequeueReusableCell(withReuseIdentifier: "resultCell", for: indexPath) as! ResultCell
        cell.backgroundColor = .white
        if(indexPath.row==0){
            cell.backgroundColor = .cyan
            cell.setup(with: dataLabel[indexPath.column])
            cell.label.font = UIFont(name: "Arial", size: 16)
        }else if (indexPath.row<=data.count) {
            cell.backgroundColor = .white
            let element = data[indexPath.row-1].data[dataLabel[indexPath.column]]!
            cell.setup(with: "\(element.rounded(8))")
            cell.label.font = UIFont(name: "Arial", size: 13)
        } else {
            switch indexPath.column {
            case 0 :
                cell.setup(with: resultLabel[indexPath.row-data.count-1])
                cell.backgroundColor = .green
            case 1 :
                cell.setup(with: "\(result[indexPath.row-data.count-1].rounded(8))")
                cell.backgroundColor = .green
            default :
                cell.setup(with: "")
                
            }
            cell.label.font = UIFont(name: "Arial", size: 13)

    
        }

    
        
       
        //print(" \(indexPath.column),\(indexPath.column)")
        return cell
    }

    func numberOfColumns(in spreadsheetView: SpreadsheetView) -> Int {
        return dataLabel.count
    }

    func numberOfRows(in spreadsheetView: SpreadsheetView) -> Int {
        return data.count + resultLabel.count+1
    }

    func spreadsheetView(_ spreadsheetView: SpreadsheetView, widthForColumn column: Int) -> CGFloat {
      return cellWidth
    }

    func spreadsheetView(_ spreadsheetView: SpreadsheetView, heightForRow row: Int) -> CGFloat {
      return cellHeight
    }

}
class ResultCell:Cell{
    let label = UILabel()
    static let identifier = "resultCell"
    public func setup(with text :String){
        label.text=text
        label.textAlignment = .center
        contentView.addSubview(label)    }
    override func layoutSubviews(){
        super.layoutSubviews()
        label.frame=contentView.bounds
        
    }
    
}
