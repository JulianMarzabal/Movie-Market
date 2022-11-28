//
//  FavouriteViewController.swift
//  Movie Market
//
//  Created by Julian Marzabal on 25/09/2022.
//

import UIKit

class FavouriteViewController: UIViewController {
    let favouriteMovieTableViewCell = FavouriteMovieTableViewCell()
 
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FavouriteMovieTableViewCell.self, forCellReuseIdentifier: FavouriteMovieTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
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
        view.backgroundColor = UIColor(named: "defaultColor")
        view.addSubview(label)
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
       
        setConstraints()

       
    }
  
    
    
    private func setConstraints() {
        let labelConstraints = [
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -250),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        let tableViewConstraints = [
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: label.bottomAnchor,constant: 10)
            
        ]
        
        
        NSLayoutConstraint.activate(labelConstraints)
        NSLayoutConstraint.activate(tableViewConstraints)
    }
    



}
extension FavouriteViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FavouriteMovieTableViewCell.identifier, for: indexPath) as? FavouriteMovieTableViewCell else { return UITableViewCell() }
       
    
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}
