//
//  MovieCollectionViewCell.swift
//  LoodosWorkshop
//
//  Created by Kaan Ozdemir on 29.05.2021.
//  Copyright © 2021 Kaan Ozdemir. All rights reserved.
//

import UIKit
import Kingfisher
import Hero

class MovieCollectionViewCell: UICollectionViewCell {

    static let cellIdentifier = "MovieCollectionViewCell"
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var rateIntlabel: UILabel!
    @IBOutlet weak var rateContainerView: UIView!
    @IBOutlet weak var rateDecimalLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var awardsLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    
    let gradientStartColor = UIColor(red: 239 / 255, green: 127 / 255, blue: 16 / 255, alpha: 1)
    let gradientEndColor = UIColor(red: 205 / 255, green: 26 / 255, blue: 85 / 255, alpha: 1)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setWith(_ movie: MovieResponse) {
        
        posterImageView.hero.id = movie.imdbID
        
        if let imageURL = URL(string: movie.poster ?? ""){
            posterImageView.kf.setImage(with: ImageResource(downloadURL: imageURL))
        }else{
            posterImageView.image = nil
        }
        
        titleLabel.text = movie.title
        yearLabel.text = movie.year
        
        if let splitedRating = movie.ratings?.first?.value?.split(separator: "/") {
            let ratings = splitedRating[0].split(separator: ".")
            rateIntlabel.text = "\(ratings[0])"
            rateDecimalLabel.text = ".\(ratings[1])"
            rateContainerView.applyGradient(startColor: gradientStartColor, endColor: gradientEndColor)
            rateContainerView.isHidden = false
        }else{
            rateContainerView.isHidden = true
        }
        
        runtimeLabel.text = movie.runtime
        genreLabel.text = movie.genre
        awardsLabel.text = movie.awards
        languageLabel.text = movie.language
    }
}
