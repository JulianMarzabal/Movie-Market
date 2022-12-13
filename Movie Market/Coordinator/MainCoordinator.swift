//
//  MainCoordinator.swift
//  Movie Market
//
//  Created by Julian Marzabal on 28/11/2022.
//
import Foundation
import UIKit
class MainCoordinator {
    
    var navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {

        let vc = WelcomeViewController()
        vc.delegate = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func presentHomeVC() {
        let homeVC = TabBarViewController()
        
        
        homeVC.homevcDelegate = self
        homeVC.modalPresentationStyle = .fullScreen
        
        
       
        navigationController.pushViewController(homeVC, animated: true)
       
    }
  
    
}

extension MainCoordinator: HomeViewDelegate {
    func onView(movie: Movie) {
        let vc = InfoViewController(movie: movie)
        navigationController.pushViewController(vc, animated: true)
        
    }
    
    
}

extension MainCoordinator: WelcomeViewDelegate {
    func onSuccess() {
        presentHomeVC()
    }
    
    
}
