//
//  ScollViewController.swift
//  AWESOME
//
//  Created by Oleksandr on 11/15/18.
//  Copyright © 2018 Oleksandr. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController {
}

extension ScrollViewController: UIScrollViewDelegate {
    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        print(#function)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(#function)
        print(scrollView.contentOffset)
    }
}
