//
//  FavouriteViewController.swift
//  Movie Market
//
//  Created by Julian Marzabal on 25/09/2022.
//

import UIKit

class FavouriteViewController: UIViewController {
    
    let favouriteMovieTableViewCell = FavouriteMovieTableViewCell()
    var favouriteMovies: [Movie] = []
 
  private  lazy var  tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FavouriteMovieTableViewCell.self, forCellReuseIdentifier: FavouriteMovieTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
      tableView.delegate = self
      tableView.dataSource = self
        return tableView
    }()
    private let label: UILabel = {
        let label = UILabel()
        label.text = " 🍿Your Favourites movies here🍿"
        label.font = .systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

   

    override func viewDidLoad() {
        super.viewDidLoad()
        


       
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        favouriteMovies = MoviesStorage.shared.movies
        view.backgroundColor = UIColor(named: "defaultColor")
        tableView.removeFromSuperview()
        label.removeFromSuperview()
        view.addSubview(label)
        view.addSubview(tableView)
        setConstraints()
        
        print(favouriteMovies.count)
        
        tableView.reloadData()
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
        return MoviesStorage.shared.movies.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FavouriteMovieTableViewCell.identifier, for: indexPath) as? FavouriteMovieTableViewCell,let title = favouriteMovies[indexPath.row].original_title else { return UITableViewCell() }
        cell.configure(data:.init(title: title))
        
    
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { _,_, completion in
            //self.favouriteMovies.remove(at: indexPath.row)
            MoviesStorage.shared.movies.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.reloadData()
            completion(true)
        }
        deleteAction.image = UIImage(systemName: "trash")
        deleteAction.backgroundColor = .systemRed
        
        let config = UISwipeActionsConfiguration(actions: [deleteAction])
        return config
    }
    
}
