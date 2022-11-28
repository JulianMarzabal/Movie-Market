//
//  FavouriteMovieTableViewCell.swift
//  Movie Market
//
//  Created by Julian Marzabal on 20/11/2022.
//

import UIKit

class FavouriteMovieTableViewCell: UITableViewCell {
    let titleTable = TitleTableViewCell()
    static let identifier = "FavouriteMovieTableViewCell"

     var favouriteLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(favouriteLabel)
        setConstrainsts()
        setFavouriteMovie()
      
    
    }
  
    func setConstrainsts() {
        NSLayoutConstraint.activate([
            favouriteLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            favouriteLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
 
    func setFavouriteMovie() {
        
        
        var name = titleTable.defaults.value(forKey:"Favourite") as? String ?? "Unknown"
        //let name = titleTable.defaults.object(forKey: "Favourite")
        print(name)
        
        favouriteLabel.text = name
        
        
    }
    
   
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}






