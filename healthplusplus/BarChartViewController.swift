//
//  BarChartViewController.swift
//  healthplusplus
//
//  Created by Axel Siliezar on 4/28/22.
//

import UIKit
import Charts

class BarChartViewController: UIViewController {

  @IBOutlet weak var barChartView: BarChartView!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    barChartView.animate(yAxisDuration: 2.0)
    barChartView.pinchZoomEnabled = false
    barChartView.drawBarShadowEnabled = false
    barChartView.drawBordersEnabled = false
    barChartView.doubleTapToZoomEnabled = false
    barChartView.drawGridBackgroundEnabled = true
      barChartView.chartDescription.text = "Water Intake"
    
    setChart(dataPoints: players, values: goals.map { Double($0) })
  }
  
  
  func setChart(dataPoints: [String], values: [Double]) {
    barChartView.noDataText = "You need to provide data for the chart."
    
    var dataEntries: [BarChartDataEntry] = []
    
    for i in 0..<dataPoints.count {
      let dataEntry = BarChartDataEntry(x: Double(i), y: Double(values[i]))
      dataEntries.append(dataEntry)
    }
    
      let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Your Water throughout the week")
    let chartData = BarChartData(dataSet: chartDataSet)
    barChartView.data = chartData
  }
}
