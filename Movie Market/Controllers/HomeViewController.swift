//
//  ViewController.swift
//  Movie Market
//
//  Created by Julian Marzabal on 25/09/2022.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController {
    
    
    private var movies: [Movie] = [Movie]()
    
    
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(logout))
        navigationItem.rightBarButtonItem?.tintColor = .systemBlue
        
        title = "Top Movies"
        view.backgroundColor = UIColor(named: "defaultColor")
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        getMovies()
        
      
            
        }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    @objc func logout () {
        UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
    }

    private func getMovies(){
        APICaller.shared.getMovies { [weak self ]results in
            switch results {
            case .success(let movies):
                print("all is ok")
                self?.movies = movies
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
                
                
            case .failure(let error):
                print(error)
            }
        }
    }


}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as? TitleTableViewCell else {
            return UITableViewCell()
        }
        let titleName = movies[indexPath.row]
        cell.configure(with: MovieViewModel(titleName: (titleName.original_title ?? titleName.original_name) ?? "Unkown Movie", posterURL: titleName.poster_path ?? ""))
        return cell

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let InfoVC = InfoViewController()
        navigationController?.pushViewController(InfoVC, animated: false)
        let info = movies[indexPath.row]
        print(info)
        InfoVC.title = movies[indexPath.row].original_name ?? movies[indexPath.row].original_title
        guard let  releaseDate = movies[indexPath.row].release_date else {return}
        guard let overview = movies[indexPath.row].overview else {return}
        let title = movies[indexPath.row].original_title ?? movies[indexPath.row].original_name ?? "Unkown"
                                                                   
        InfoVC.label.text =
        
        
        
        "Overview: \(title)\n \n \(overview) \n \n Release date: \(releaseDate) \n \n \n \n See you soon in the great Movie Market"
        
    }
    
    
}
