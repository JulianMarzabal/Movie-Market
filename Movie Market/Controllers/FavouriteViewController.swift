//
//  FavouriteViewController.swift
//  Movie Market
//
//  Created by Julian Marzabal on 25/09/2022.
//

import UIKit

class FavouriteViewController: UIViewController {
    
 
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = " 🍿Your Favourites movies here🍿"
        label.font = .systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    let data = ["Movie 1", "Movie 2", "Movie 3","Movie 4"]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        view.addSubview(label)
       
        setConstraints()

       
    }
  
    
    
    private func setConstraints() {
        let labelConstraints = [
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -250),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        
        NSLayoutConstraint.activate(labelConstraints)
    }
    



}
