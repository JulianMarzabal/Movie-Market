//
//  ViewController.swift
//  Movie Market
//
//  Created by Julian Marzabal on 25/09/2022.
//

import UIKit
import Alamofire



class HomeViewController: UIViewController {
    
    var viewModel: HomeViewmodel
    
    init(viewModel: HomeViewmodel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 
    private(set) lazy var  tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        bindReaction()
        viewModel.getMovies()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(logout))
        navigationItem.rightBarButtonItem?.tintColor = .systemBlue
        
        title = "Top Movies"
        view.backgroundColor = UIColor(named: "defaultColor")
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
      
        
        }
    private func bindReaction(){
        viewModel.onSuccessfulUpdateReaction = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.updateViewModel()
    }
    @objc func logout () {
        viewModel.delegate?.onLogOut()
    }

 


}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as? TitleTableViewCell else {
            return UITableViewCell()
        }
        let movie = viewModel.movieViewModel[indexPath.row]
        
        cell.configure(with: movie)
        cell.delegate = self
        
        return cell

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movieViewModel.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectMovieBy(index: indexPath.row)
       
       
        
        
        
    }
    
    
}
extension HomeViewController: TitleTableViewCellDelegate {
    func onSelect(model: MovieViewModel, isSelectected: Bool) {
        viewModel.updateMovie(id: model.id, isSelected: isSelectected)
    }
    
    
}


