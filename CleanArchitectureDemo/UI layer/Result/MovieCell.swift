//
//  MovieCell.swift
//  CleanArchitectureDemo
//
//  Created by Nikola Matijevic on 30/04/2019.
//  Copyright © 2019 Nikola Matijevic. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    var posterPath: String?
    @IBOutlet weak var posterImageView: UIImageView!

    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.posterPath = nil
        self.dateLabel.text = ""
        self.posterImageView.image = nil
    }
}
