//
//  AwesomeTableViewCell.swift
//  AWESOME
//
//  Created by Oleksandr on 11/22/18.
//  Copyright © 2018 Oleksandr. All rights reserved.
//

import UIKit

class AwesomeTableViewCell: UITableViewCell {
    static let reuseIdentifier: String = "AwesomeCell"
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!

    var onButtonTap: ((Bool) -> ())?
    
    @IBAction private func rightButtonTouch(_ sender: UIButton) {
        activityIndicator.isAnimating ? activityIndicator.stopAnimating() : activityIndicator.startAnimating()
        
        onButtonTap?(activityIndicator.isAnimating)
    }
    
    
}
