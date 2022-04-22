//
//  TabBarCustomizator.swift
//  healthplusplus
//
//  Created by Axel Siliezar on 4/20/22.
//

import UIKit

class TabBarCustomizator {
    
    // MARK: - Properties
    var tabBar: UITabBar!
    private let bumpHeight: CGFloat = 16
    private let shapeLayer = CAShapeLayer()
    private let darkColor: UIColor = UIColor(red: 0.07, green: 0.07, blue: 0.07, alpha: 1.0)
    private let lightColor: UIColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.0)
    private let redButton = UIView()
    private let redButtonRadius: CGFloat = 29
    private let imgRedButtonIcon = UIImageView(image: UIImage(systemName: "sunrise", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25, weight: .medium)))
    var isRedButtonMovedUp = false
    
    // MARK: - Methods
    func customize() {
        addShape()
        createRedButton()
    }
    
    private func addShape() {
        shapeLayer.path = createPath()
        shapeLayer.fillColor = darkColor.cgColor
        shapeLayer.shadowColor = UIColor.black.cgColor
        shapeLayer.shadowRadius = 3
        shapeLayer.shadowOffset = CGSize(width: 0, height: 3)
        shapeLayer.shadowOpacity = 1
        
        tabBar.layer.insertSublayer(shapeLayer, at: 0)
    }
    
    private func createPath() -> CGPath {
        let path = UIBezierPath()
        let centerWidth = tabBar.frame.midX
        let topYInset: CGFloat = 8
        let buttonXInset: CGFloat = 12
        let kCurveCorrection: CGFloat = 5
        
        // Start from top left corner
        path.move(to: CGPoint(x: 0, y: -topYInset))
        path.addLine(to: CGPoint(x: (centerWidth - (redButtonRadius + bumpHeight + buttonXInset)), y: -topYInset))
        
        // Begin of bump
        path.addCurve(to: CGPoint(x: centerWidth, y: -bumpHeight - topYInset), controlPoint1: CGPoint(x: centerWidth - redButtonRadius - kCurveCorrection, y: -topYInset), controlPoint2: CGPoint(x: (centerWidth - redButtonRadius + kCurveCorrection), y: -bumpHeight - topYInset))
        // End of bump
        path.addCurve(to: CGPoint(x: centerWidth + (redButtonRadius + bumpHeight + buttonXInset), y: -topYInset), controlPoint1: CGPoint(x: (centerWidth + redButtonRadius - kCurveCorrection), y: -bumpHeight - topYInset), controlPoint2: CGPoint(x: centerWidth + redButtonRadius + kCurveCorrection, y: -topYInset))
        
        path.addLine(to: CGPoint(x: tabBar.frame.width, y: -topYInset))
        path.addLine(to: CGPoint(x: tabBar.frame.width, y: tabBar.frame.height * 2))
        path.addLine(to: CGPoint(x: 0, y: tabBar.frame.height * 2))
        path.close()
        
        return path.cgPath
    }
    
    private func createRedButton() {
        let tabBarHeight = UIScreen.main.bounds.size.height - tabBar.frame.minY
        imgRedButtonIcon.center = CGPoint(x: tabBar.frame.midX, y: (tabBarHeight - bumpHeight) / 2.0)
        
        let circle = CAShapeLayer()
        circle.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 2 * redButtonRadius, height: 2 * redButtonRadius), cornerRadius: redButtonRadius).cgPath
        circle.fillColor = UIColor.systemRed.cgColor
        circle.position = CGPoint(x: imgRedButtonIcon.center.x - redButtonRadius, y: imgRedButtonIcon.center.y - redButtonRadius)
        circle.shadowColor = UIColor.black.withAlphaComponent(0.3).cgColor
        circle.shadowRadius = 5
        circle.shadowOffset = .zero
        circle.shadowOpacity = 1
        
        redButton.tintColor = .white
        redButton.layer.addSublayer(circle)
        redButton.addSubview(imgRedButtonIcon)
        tabBar.addSubview(redButton)
    }
    
    func moveButton() {
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       options: [],
                       animations: { [weak self] in
                        guard let self = self else { return }
                        if self.isRedButtonMovedUp {
                            self.redButton.center.y += self.redButtonRadius * 0.2
                            self.isRedButtonMovedUp.toggle()
                        } else {
                            self.redButton.center.y -= self.redButtonRadius * 0.2
                            self.isRedButtonMovedUp.toggle()
                        }
                        self.redButton.tintColor = self.isRedButtonMovedUp ? .white : .systemYellow },
                       completion: { _ in
                        self.changeRedButtonIcon() }
        )
    }
    
    private func changeRedButtonIcon() {
        let configuration = UIImage.SymbolConfiguration(pointSize: 25, weight: .medium)
        
        if isRedButtonMovedUp {
            imgRedButtonIcon.image = UIImage(systemName: "sunset", withConfiguration: configuration)
            redButton.tintColor = .systemYellow
        } else {
            imgRedButtonIcon.image = UIImage(systemName: "sunrise", withConfiguration: configuration)
            redButton.tintColor = .white
        }
    }
    
    func toggleTabBarStyle() {
        shapeLayer.fillColor = isRedButtonMovedUp ? lightColor.cgColor : darkColor.cgColor
    }
}
