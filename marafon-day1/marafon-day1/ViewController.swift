//
//  ViewController.swift
//  marafon-day1
//
//  Created by Timofey Privalov on 01.03.2023.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var rectangleView: UIView!
    @IBOutlet var shadowView: UIView!
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        setupShadowView()
    }
    
    // MARK: - Private methods
    private func setupView() {
        rectangleView.layer.masksToBounds = true
        rectangleView.layer.cornerRadius = 15
        
        let gradient = CAGradientLayer()
        gradient.frame = rectangleView.layer.bounds
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        
        let blueColor = UIColor(red: 100, green: 146, blue: 185)
        let midColor = UIColor(red: 161, green: 101, blue: 120)
        let redColor = UIColor(red: 233, green: 66, blue: 55)
        gradient.colors = [blueColor.cgColor,
                           midColor.cgColor,
                           redColor.cgColor]
        rectangleView.layer.insertSublayer(gradient, at: 0)
    }
    
    private func setupShadowView() {
        shadowView.layer.zPosition = -1
        shadowView.clipsToBounds = true
        shadowView.layer.cornerRadius = 15
        shadowView.layer.opacity = 0.5
        shadowView.backgroundColor = .gray
        
        shadowView.layer.masksToBounds = false
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOpacity = 1
        shadowView.layer.shadowOffset = .zero
        shadowView.layer.shadowRadius = 8
        
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            shadowView.centerXAnchor.constraint(equalTo: rectangleView.centerXAnchor, constant: 3),
            shadowView.centerYAnchor.constraint(equalTo: rectangleView.centerYAnchor, constant: 3),
            shadowView.widthAnchor.constraint(equalTo: rectangleView.widthAnchor),
            shadowView.heightAnchor.constraint(equalTo: rectangleView.heightAnchor)
        ])
        shadowView.layoutIfNeeded()
    }
}
