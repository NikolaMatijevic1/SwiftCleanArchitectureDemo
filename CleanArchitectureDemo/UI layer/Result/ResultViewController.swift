//
//  ResultViewController.swift
//  CleanArchitectureDemo
//
//  Created by Nikola Matijevic on 28/04/2019.
//  Copyright © 2019 Nikola Matijevic. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
    }
}

extension ResultViewController: UITableViewDelegate { }
