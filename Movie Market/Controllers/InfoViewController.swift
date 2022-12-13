//
//  InfoViewController.swift
//  Movie Market
//
//  Created by Julian Marzabal on 26/09/2022.
//

import UIKit

class InfoViewController: UIViewController {
    init(movie:Movie){
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private var movie: Movie
    
    private lazy var label: UILabel = {
        var label = UILabel()
        label.text = "Overview: \(movie.original_title ?? "unknown")\n \n \n \n \n Release date \n \n \n \n See you soon in the great Movie Market"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        
        return label
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = movie.original_name ?? movie.original_title ?? "unknown"
        view.backgroundColor = UIColor(named: "defaultColor")
        view.addSubview(label)
        configureConstraints()

        
    }
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor,constant: 200),
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
        label.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20)
        
        ])
    }
    


}
