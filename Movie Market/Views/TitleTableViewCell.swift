//
//  TitleTableViewCell.swift
//  Movie Market
//
//  Created by Julian Marzabal on 27/09/2022.
//

import UIKit
import SDWebImage

protocol TitleTableViewCellDelegate: AnyObject {
    func onSelect(model: MovieViewModel, isSelectected: Bool)
}
class TitleTableViewCell: UITableViewCell {
   
    weak var delegate: TitleTableViewCellDelegate?
    
    static let identifier = "TitleTableViewCell"
    
    let favouriteButtom: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "star.fill",withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        
        button.setImage(image, for: .normal)
        button.tintColor = .systemBlue
        button.addTarget(self, action: #selector(favouriteMovie), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    private let movieUIImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(movieUIImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(favouriteButtom)
        setConstraints()
    
                
    }
    
    private func setConstraints() {
        let movieUIImageConstraints = [
            movieUIImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            movieUIImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            movieUIImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -15),
            movieUIImageView.widthAnchor.constraint(equalToConstant: 100)
        ]
        let titleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: movieUIImageView.trailingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -60)
        ]
        let favouriteButtomConstraints = [
            favouriteButtom.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20),
            favouriteButtom.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            
        
        ]
        
        NSLayoutConstraint.activate(movieUIImageConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(favouriteButtomConstraints)
        
    }
    
    
    @objc func favouriteMovie() {

        guard let viewmodel = viewmodel else {return}
        favouriteButtom.tintColor = !isMovieSelected ? .systemYellow : .systemBlue
        isMovieSelected = !isMovieSelected
        self.delegate?.onSelect(model: viewmodel, isSelectected: isMovieSelected)
        
    }
    var viewmodel: MovieViewModel?
    var isMovieSelected: Bool = false
    public func configure(with model: MovieViewModel) {
        self.viewmodel = model
        guard let url = URL(string:"https://image.tmdb.org/t/p/w500/\(model.posterURL)") else {return}
        isMovieSelected =  model.isSelectedMovie
        favouriteButtom.tintColor = isMovieSelected ? .systemYellow : .systemBlue
        
       
        
        movieUIImageView.sd_setImage(with: url)
        titleLabel.text = model.titleName
        titleLabel.numberOfLines = 0
    }
        
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
