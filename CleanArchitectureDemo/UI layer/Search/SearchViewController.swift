//
//  ViewController.swift
//  CleanArchitectureDemo
//
//  Created by Nikola Matijevic on 28/04/2019.
//  Copyright © 2019 Nikola Matijevic. All rights reserved.
//

import UIKit

protocol SearchDelegate: class {
    func userAskedForSearch(with term: String)
}
class SearchViewController: UIViewController {
    @IBOutlet weak var errorLabel: UILabel!
    weak var searchDelegate: SearchDelegate?
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        guard let movieTerm = textField.text, movieTerm.count != 0 else {
            errorLabel.isHidden = false
            errorLabel.text = "Morate unijeti tekst za pretragu"
            return
        }
        searchDelegate?.userAskedForSearch(with: movieTerm)
    }
}
