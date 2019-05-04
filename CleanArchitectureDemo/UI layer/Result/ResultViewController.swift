//
//  ResultViewController.swift
//  CleanArchitectureDemo
//
//  Created by Nikola Matijevic on 28/04/2019.
//  Copyright © 2019 Nikola Matijevic. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    let searchTerm: String
    let dataSource: ResultVCDataSource
    @IBOutlet weak var tableView: UITableView!
    let cellID = "movieCell"

    init(searchTerm: String, dataSource: ResultVCDataSource) {
        self.searchTerm = searchTerm
        self.dataSource = dataSource
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) { return nil }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.dataSource = dataSource
        dataSource.feedback = self
        tableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: cellID )
        dataSource.fetchMovies(for: searchTerm)
        dataSource.fetchPosters(for: tableView.indexPathsForVisibleRows ?? [], in: tableView)
    }
}

extension ResultViewController: UITableViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        dataSource.fetchPosters(for: tableView.indexPathsForVisibleRows ?? [], in: tableView)

    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        dataSource.fetchPosters(for: tableView.indexPathsForVisibleRows ?? [], in: tableView)
    }
}

extension ResultViewController: DataSourceUpdateFeedback {
    func dataSourceUpdated() {
        tableView.reloadData()
        dataSource.fetchPosters(for: tableView.indexPathsForVisibleRows ?? [], in: tableView)
    }
}
