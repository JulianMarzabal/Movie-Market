//
//  InfoViewController.swift
//  Movie Market
//
//  Created by Julian Marzabal on 26/09/2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    public var label: UILabel = {
        var label = UILabel()
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        
        return label
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movie Details"
        view.backgroundColor = .systemGray4
        view.addSubview(label)
        configureConstraints()

        
    }
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor,constant: 250),
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
        label.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20)
        
        ])
    }
    


}
