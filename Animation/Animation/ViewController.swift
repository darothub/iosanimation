//
//  ViewController.swift
//  Animation
//
//  Created by Darot on 21/04/2020.
//  Copyright © 2020 Decagon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var newView:UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        view.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        return view
    }()
    

    let titleLable = UILabel()
    let bodyLabel = UILabel()
    fileprivate func setupLabels() {
        titleLable.backgroundColor = .red
        bodyLabel.backgroundColor = .green
        bodyLabel.numberOfLines = 0
        titleLable.text = "Title"
        titleLable.font = UIFont(name: "Futura", size: 34)
        titleLable.numberOfLines = 0
        bodyLabel.text = "Body"
    }
    
    fileprivate func setupStackView() {
        let stackView = UIStackView(arrangedSubviews: [titleLable, bodyLabel])
        stackView.axis = .vertical
        view.addSubview(stackView)
        //        stackView.frame = CGRect(x: 0, y: 0, width: 200, height: 400)
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let document = CAShapeLayer()

//        thisView.frame = CGRect(x: 0, y: 0, width: 200, height: 400)
        newView.layer.addSublayer(document)
        view.addSubview(newView)
        newView.translatesAutoresizingMaskIntoConstraints = false
//
//        newView.center = view.center

        newView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        newView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        newView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0).isActive = true

        newView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        newView.heightAnchor.constraint(equalToConstant: 200).isActive = true

        document.strokeColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

        let size = CGSize(width: 100, height: 150)
        let foldInset:CGFloat = 30

        let path = CGMutablePath()
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: 0, y: size.height))
        path.addLine(to: CGPoint(x: size.width, y: size.height))
        path.addLine(to: CGPoint(x: size.width, y: foldInset))
        path.addLine(to: CGPoint(x: size.width - foldInset, y: 0))
        path.move(to: .zero)

        path.move(to: CGPoint(x: size.width - foldInset, y: 0))
        path.addLine(to: CGPoint(x: size.width - foldInset, y: foldInset))
        path.addLine(to: CGPoint(x: size.width, y: foldInset))
        document.path = path
        document.position = CGPoint(x: newView.frame.size.width/4, y: newView.frame.size.height/8)
        print("\(self.newView.frame.width)")
        
//        view.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
//        setupLabels()
//        setupStackView()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapAnimation)))
        
        
//        let layer = CAShapeLayer()
//        layer.path = UIBezierPath(roundedRect: CGRect(x: 64, y: 64, width: 100, height: 120), cornerRadius: 0).cgPath
//        layer.fillColor = UIColor.red.cgColor
//        view.layer.addSublayer(layer)
    }
    
    @objc fileprivate func handleTapAnimation(){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            
            self.newView.transform = CGAffineTransform(translationX: -30, y: 0)
        }) { (Bool) in
            UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveLinear, animations: {
                self.newView.alpha = 0
                self.newView.transform = CGAffineTransform(translationX: 0, y: -550)
            })
        }
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
               
               self.bodyLabel.transform = CGAffineTransform(translationX: -30, y: 0)
           }) { (Bool) in
               UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                   self.bodyLabel.alpha = 0
                   self.bodyLabel.transform = CGAffineTransform(translationX: 0, y: -550)
               })
           }
    }


}

