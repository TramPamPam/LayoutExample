//
//  AwesomeViewController.swift
//  AWESOME
//
//  Created by Oleksandr on 11/8/18.
//  Copyright © 2018 Oleksandr. All rights reserved.
//

import UIKit

class AwesomeViewController: UIViewController {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var nameTextField: UITextField!
    
    @IBOutlet private weak var centeredView: UIView!
    
//    var handmadeLabel = UILabel(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 20, height: 30)))
    var button = UIButton(type: UIButton.ButtonType.contactAdd)
    
    
    @IBOutlet weak var catButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        debugPrint("1 viewDidLoad \(nameLabel.frame)")
        
        let screenSize = UIScreen.main.bounds.size
        let center = CGPoint(x: screenSize.width/2, y: screenSize.height/2)
        let offsetedCenter = CGPoint(x: center.x - 100.0, y: center.y + 150)
            
        button.frame = CGRect(origin: offsetedCenter, size: CGSize(width: 200, height: 100))
        button.tintColor = .black
        button.backgroundColor = .red

        button.setTitle("Added from code", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        
        button.setTitle("Selected", for: .selected)
        
        button.addTarget(self, action: #selector(clearName), for: .touchUpInside)
        
        view.addSubview(button)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        debugPrint("2 viewWillAppear  \(nameLabel.frame)")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        debugPrint("3 viewWillLayoutSubviews \(nameLabel.frame)")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        debugPrint("4 viewDidLayoutSubviews \(nameLabel.frame)")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        debugPrint("5 viewDidAppear \(nameLabel.frame)")
    }
    
    @objc func clearName(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        sender.backgroundColor = sender.isSelected ? .black : .red
        nameTextField.text = ""
    }
    
    @IBAction func changedName(_ sender: Any) {
        nameLabel.text = nameTextField.text
    }
    
    @IBAction func apply(_ sender: Any) {
        nameLabel.text = nameTextField.text
    }
}
