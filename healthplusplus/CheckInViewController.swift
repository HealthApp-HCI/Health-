//
//  CheckInViewController.swift
//  healthplusplus
//
//  Created by Marty Nodado on 4/27/22.
//

import UIKit

class CheckInViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeadingCell", for: indexPath) as! HeadingCell
            
            cell.headingLabel.text = "Welcome back nerd!"
            cell.subtitleLabel.text = "Today's Goal Progress"
            cell.backgroundColor = UIColor.white
            
//            let height = cell.circularView.frame.size.height
//            let width = cell.circularView.safeAreaLayoutGuide.layoutFrame.size.width
//            let progress = KDCircularProgress(frame: CGRect(x: 0, y: 0, width: width, height: height))
//                    progress.startAngle = -90
//            progress.angle = 240.0
//            progress.set(colors: UIColor.green)
//            progress.clockwise = true
//            progress.roundedCorners = false
//
//            cell.circularView.addSubview(progress)

            return cell
        }
        
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DailyGoalCell", for: indexPath) as! DailyGoalCell
            cell.headingLabel.text = "Running"
            cell.backgroundColor = UIColor(hex: "#F0F0F0FF")
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = view.frame.size.height
        let width = view.safeAreaLayoutGuide.layoutFrame.size.width * 0.9
        
        if indexPath.row == 0 {
            return CGSize(width: width, height: height * 0.5)
        } else {
            return CGSize(width: width, height: height * 0.125)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
