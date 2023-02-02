//
//  TabBarViewController.swift
//  Movie Market
//
//  Created by Julian Marzabal on 25/09/2022.
//

import UIKit

class TabBarViewController: UITabBarController {
    weak var homevcDelegate: HomeViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.backgroundColor = .systemPink
        self.tabBar.barTintColor = .systemPink
        self.tabBar.unselectedItemTintColor = .systemGray
        let homeViewModel = HomeViewmodel()
        homeViewModel.delegate = self
        
        
        let vc1 = HomeViewController(viewModel: homeViewModel)
        let vc2 = FavouriteViewController()
       
        vc1.navigationItem.largeTitleDisplayMode = .always
        vc2.navigationItem.largeTitleDisplayMode = .always
        
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        
        nav1.tabBarItem = UITabBarItem(title: "Movies", image: UIImage(systemName: "4k.tv"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Favourites", image: UIImage(systemName: "star.fill"), tag: 1)
        
        nav1.navigationBar.prefersLargeTitles = true
        nav2.navigationBar.prefersLargeTitles = true
        
        setViewControllers([nav1,nav2], animated: false)
      
        

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: true)
       
        
        
        
    }
    


}
extension TabBarViewController: HomeViewDelegate {
    func onLogOut() {
        self.homevcDelegate?.onLogOut()
    }
    
  
    
  
    
    func onView(movie: Movie) {
        self.homevcDelegate?.onView(movie: movie)
    }
    
    
}
