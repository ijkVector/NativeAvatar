//
//  ViewController.swift
//  NativeAvatar
//
//  Created by Иван Дроботов on 24.02.2024.
//

import UIKit

final class ViewController: UIViewController, UIScrollViewDelegate {

    private let imageView = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
    private let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = view.bounds
        
        scrollView.delegate = self
    }
    
    private func style() {
        
        view.backgroundColor = .systemBackground
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Avatar"
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .systemGray
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        view.addSubview(scrollView)
        guard let navigationBar = navigationController?.navigationBar else { return }
        navigationBar.addSubview(imageView)
        
        scrollView.contentSize = CGSize(width: view.frame.width, height: UIScreen.main.bounds.height*1.05)
        
        NSLayoutConstraint.activate([
            
            imageView.heightAnchor.constraint(equalToConstant: 36),
            imageView.widthAnchor.constraint(equalToConstant: 36),
            imageView.trailingAnchor.constraint(equalTo: navigationBar.trailingAnchor, constant: -16),
            imageView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: -16),
            
        ])
    }
}

extension ViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        imageView.isHidden = imageView.frame.origin.y <= 16
    }
}
