//
//  LineChartViewController.swift
//  healthplusplus
//
//  Created by Axel Siliezar on 4/28/22.
//

import UIKit
import Charts

class LineChartViewController: UIViewController {
  
  @IBOutlet weak var lineChartView: LineChartView!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    customizeChart(dataPoints: players, values: goals.map{ Double($0) })
  }
  
  func customizeChart(dataPoints: [String], values: [Double]) {
    
    var dataEntries: [ChartDataEntry] = []
    
    for i in 0..<dataPoints.count {
      let dataEntry = ChartDataEntry(x: values[i], y: Double(i))
      dataEntries.append(dataEntry)
    }
    
      let lineChartDataSet = LineChartDataSet(entries: dataEntries, label: "")
    let lineChartData = LineChartData(dataSet: lineChartDataSet)
    lineChartView.data = lineChartData
  }
}
