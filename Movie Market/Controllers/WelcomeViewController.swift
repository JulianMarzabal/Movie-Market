//
//  WelcomeViewController.swift
//  Movie Market
//
//  Created by Julian Marzabal on 25/09/2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemRed
        return label
    }()
    
    private let emailField: UITextField = {
        let email = UITextField()
        email.placeholder = "Introduce your email"
        email.textAlignment = .center
        email.backgroundColor = .white
        email.layer.cornerRadius = 40 / 4
        email.layer.borderWidth = 1
        email.layer.borderColor = UIColor.systemBackground.cgColor
        email.translatesAutoresizingMaskIntoConstraints = false
        
        
        return email
        
    }()
    
    private let SignInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray5
        button.setTitle("Sign in for free", for: .normal)
        button.setTitleColor(.blue , for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = " Movie Market"
        view.backgroundColor = .systemGray5
        view.addSubview(SignInButton)
        view.addSubview(emailField)
        view.addSubview(label)
        setContraints()
        
        SignInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)

       
    }
    
    
    @objc func didTapSignIn() {
        if emailField.text == "" {
            print("Empty")
            label.text = "Introduce an email"
            
        } else {
            let vc = TabBarViewController()
            vc.navigationItem.largeTitleDisplayMode = .always
            navigationController?.pushViewController(vc, animated: true)
            
        }
        
        
    }
    private func setContraints() {
        NSLayoutConstraint.activate([
            
            emailField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            emailField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            SignInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            SignInButton.bottomAnchor.constraint(equalTo: emailField.centerYAnchor, constant: 90),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 25)
            
        ])
    }

  

}
