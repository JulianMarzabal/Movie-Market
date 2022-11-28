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
    
    private let Titlelabel: UILabel = {
        let label = UILabel()
        label.text = "Movie Market"
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
       
        return label
    }()
    private let image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "icon")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let emailField: UITextField = {
        let email = UITextField()
        email.placeholder = "Introduce your email"
        email.textAlignment = .center
        email.backgroundColor = UIColor(named: "defaultColor")
        email.layer.cornerRadius = 12
        email.layer.borderWidth = 1
        email.layer.borderColor = UIColor(named: "changeColor")?.cgColor
        email.translatesAutoresizingMaskIntoConstraints = false
        email.autocorrectionType = .no
        email.autocapitalizationType = .none
        email.returnKeyType = .done
        
        
        
        return email
        
    }()
    
    private let SignInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray5
        button.setTitle("Sign in for free", for: .normal)
        button.setTitleColor(.blue , for: .normal)
        button.backgroundColor = UIColor(named: "defaultColor")
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "defaultColor")
        view.addSubview(SignInButton)
        view.addSubview(emailField)
        view.addSubview(label)
        view.addSubview(Titlelabel)
        view.addSubview(image)
        setContraints()
        
        SignInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)

       
    }
    
    
    @objc func didTapSignIn() {
        if emailField.text!.contains("@") && emailField.text!.contains(".com") {
            let vc = TabBarViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false)
            //navigationController?.pushViewController(vc, animated: true)
            
            
        } else {
            label.text = "Introduce an email"
        
        }
        
        
    }
    private func setContraints() {
        NSLayoutConstraint.activate([
            Titlelabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            Titlelabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            emailField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            SignInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            SignInButton.bottomAnchor.constraint(equalTo: emailField.centerYAnchor, constant: 90),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 25),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: Titlelabel.centerYAnchor,constant: 130)
            
        ])
    }

  

}
