//
//  TableExampleViewController.swift
//  AWESOME
//
//  Created by Oleksandr on 11/22/18.
//  Copyright © 2018 Oleksandr. All rights reserved.
//

import UIKit

class TableExampleViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    var elements: [String] = ["one", "two", "three", "four"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: "AwesomeTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: AwesomeTableViewCell.reuseIdentifier)
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension TableExampleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        switch indexPath.row {
        case 0, 3:
            cell = tableView.dequeueReusableCell(withIdentifier: AwesomeTableViewCell.reuseIdentifier, for: indexPath)
            (cell as? AwesomeTableViewCell)?.statusLabel.text = elements[indexPath.row]
            (cell as? AwesomeTableViewCell)?.onButtonTap = { [weak self] (isAnimating) in
                guard let self = self else { return }
                let status = isAnimating ? "animating" : "stable"
                self.elements[indexPath.row] = self.elements[indexPath.row] + " \(status)"
                debugPrint(self.elements[indexPath.row])
                self.view.backgroundColor = isAnimating ? .green : .white
            }
        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: "catCell", for: indexPath)
            cell.textLabel?.text = elements[indexPath.row]
            cell.detailTextLabel?.text = "\(indexPath.row)"
        default:
            cell = tableView.dequeueReusableCell(withIdentifier: "ordinaryCell", for: indexPath)
            cell.textLabel?.text = elements[indexPath.row]
            cell.detailTextLabel?.text = "\(indexPath.row)"
        }
        return cell

    }
}

extension TableExampleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 100
        default:
            return 64
        }
    }
}
