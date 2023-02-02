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
        let vm = WelcomeViewModel()
        vm.delegate = self
        let vc = WelcomeViewController(viewModel: vm)
        
        
        navigationController.pushViewController(vc, animated: true)
    }
    func removeLastController() {
        navigationController.popViewController(animated: true)
    }
    
    func presentHomeVC() {
        let homeVC = TabBarViewController()
        
        homeVC.homevcDelegate = self
        homeVC.modalPresentationStyle = .fullScreen
        
        
            navigationController.pushViewController(homeVC, animated: true)
    
    }
  
    
  
    
}

extension MainCoordinator: HomeViewDelegate {
    func onLogOut() {
        
        removeLastController()
    }
    
  
    func onView(movie: Movie) {
    
        let vc = InfoViewController(viewModel: .init(movie: movie))
    
        navigationController.pushViewController(vc, animated: true)
        
    }

}

extension MainCoordinator: WelcomeViewDelegate {
    func onSuccess() {
      
        presentHomeVC()
    }
    
    
}


