//
//  MovieDetailVC.swift
//  LoodosWorkshop
//
//  Created by Kaan Ozdemir on 29.05.2021.
//  Copyright © 2021 Kaan Ozdemir. All rights reserved.
//

import UIKit
import Kingfisher

class MovieDetailVC: UIViewController {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var poster2ImageView: UIImageView!
    @IBOutlet weak var movieTypeLabel: UILabel!
    @IBOutlet weak var rateIntLabel: UILabel!
    @IBOutlet weak var rateDecimalLabel: UILabel!
    
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var plotLabel: UILabel!
    @IBOutlet weak var actorsLabel: UILabel!
    
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    var viewModel = MovieDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMovieDetail()
    }
    
    func setMovieDetail() {
        if let imageURL = URL(string: viewModel.movie?.poster ?? ""){
            posterImageView.kf.setImage(with: ImageResource(downloadURL: imageURL))
            poster2ImageView.kf.setImage(with: ImageResource(downloadURL: imageURL))
        }else{
            posterImageView.image = nil
            poster2ImageView.image = nil
        }
        
        movieTypeLabel.text = viewModel.movie?.type
        
        if let splitedRating = viewModel.movie?.ratings?.first?.value?.split(separator: "/") {
            let ratings = splitedRating[0].split(separator: ".")
            rateIntLabel.text = "\(ratings[0])"
            rateDecimalLabel.text = ".\(ratings[1])"
        }
        
        movieNameLabel.text = viewModel.movie?.title
        plotLabel.text = viewModel.movie?.plot
        actorsLabel.text = viewModel.movie?.actors
    }
}
