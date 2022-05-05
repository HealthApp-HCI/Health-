//
//  GraphViewController.swift
//  healthplusplus
//
//  Created by Axel Siliezar on 4/28/22.
//
import UIKit

class GraphViewController: UIViewController {

  var ourStoryboard: UIStoryboard?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    ourStoryboard = UIStoryboard(name: "Main", bundle: nil)
  }
  @IBAction func didTapOnPieChartButton(_ sender: Any) {
    
    guard let vc = ourStoryboard?.instantiateViewController(withIdentifier: "PieChartViewController") as? PieChartViewController else { return }
    self.navigationController?.pushViewController(vc, animated: true)
  }
  
  @IBAction func didTapOnLineChartButton(_ sender: Any) {
    
    guard let vc = ourStoryboard?.instantiateViewController(withIdentifier: "LineChartViewController") as? LineChartViewController else { return }
    self.navigationController?.pushViewController(vc, animated: true)
  }
  
  @IBAction func didTapOnBarChartButton(_ sender: Any) {
    
    guard let vc = ourStoryboard?.instantiateViewController(withIdentifier: "BarChartViewController") as? BarChartViewController else { return }
    self.navigationController?.pushViewController(vc, animated: true)
  }
}
