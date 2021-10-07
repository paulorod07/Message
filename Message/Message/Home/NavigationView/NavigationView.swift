//
//  NavigationView.swift
//  Message
//
//  Created by Paulo Rodrigues on 21/09/21.
//

import UIKit

enum typeConversationOrContact {
    case conversation
    case contact
}

protocol NavigationViewProtocol: AnyObject {
    func typeScreenMessage(type: typeConversationOrContact)
}

class NavigationView: UIView {
    
    weak private var delegate: NavigationViewProtocol?
    
    func delegate(delegate: NavigationViewProtocol) {
        self.delegate = delegate
    }
    
    lazy var navigationBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .white
        view.layer.cornerRadius = 35
        view.layer.maskedCorners = [.layerMaxXMaxYCorner]
        view.layer.shadowColor = UIColor(white: 0, alpha: 0.02).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 10
        
        return view
    }()
    
    lazy var navigationBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .clear
        
        return view
    }()
    
    lazy var searchBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = CustomColor.appLight
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        
        return view
    }()
    
    lazy var searchLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Digite aqui"
        label.font = UIFont(name: CustomFont.poppinsMedium, size: 16)
        label.textColor = .lightGray
        
        return label
    }()
    
    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setImage(UIImage(named: "search"), for: .normal)
        
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 10
        
        return stackView
    }()
    
    lazy var conversationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setImage(UIImage(systemName: "message")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .systemPink
        button.addTarget(self, action: #selector(self.tappedConversationButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var contactButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setImage(UIImage(named: "group")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .systemPink
        button.addTarget(self, action: #selector(self.tappedContactButton), for: .touchUpInside)
        
        return button
    }()
    
    @objc func tappedConversationButton() {
        self.delegate?.typeScreenMessage(type: .conversation)
        
        self.conversationButton.tintColor = .systemPink
        self.contactButton.tintColor = .black
    }
    
    @objc func tappedContactButton() {
        self.delegate?.typeScreenMessage(type: .contact)
        
        self.conversationButton.tintColor = .black
        self.contactButton.tintColor = .systemPink
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
        self.addSubview(self.navigationBackgroundView)
        self.navigationBackgroundView.addSubview(self.navigationBar)
        self.navigationBar.addSubview(self.searchBar)
        self.navigationBar.addSubview(self.stackView)
        self.searchBar.addSubview(self.searchLabel)
        self.searchBar.addSubview(self.searchButton)
        self.stackView.addArrangedSubview(self.conversationButton)
        self.stackView.addArrangedSubview(self.contactButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            self.navigationBackgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.navigationBackgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.navigationBackgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            self.navigationBackgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            
            self.navigationBar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.navigationBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.navigationBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.navigationBar.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            
            self.searchBar.leadingAnchor.constraint(equalTo: self.navigationBar.leadingAnchor, constant: 30),
            self.searchBar.centerYAnchor.constraint(equalTo: self.navigationBar.centerYAnchor),
            self.searchBar.trailingAnchor.constraint(equalTo: self.stackView.leadingAnchor, constant: -20),
            self.searchBar.heightAnchor.constraint(equalToConstant: 55),
            
            
            self.stackView.trailingAnchor.constraint(equalTo: self.navigationBar.trailingAnchor, constant: -30),
            self.stackView.centerYAnchor.constraint(equalTo: self.navigationBar.centerYAnchor),
            self.stackView.widthAnchor.constraint(equalToConstant: 100),
            self.stackView.heightAnchor.constraint(equalToConstant: 30),
            
            
            self.searchLabel.leadingAnchor.constraint(equalTo: self.searchBar.leadingAnchor, constant: 25),
            self.searchLabel.centerYAnchor.constraint(equalTo: self.searchBar.centerYAnchor),
            
            
            self.searchButton.trailingAnchor.constraint(equalTo: self.searchBar.trailingAnchor, constant: -20),
            self.searchButton.centerYAnchor.constraint(equalTo: self.searchBar.centerYAnchor),
            self.searchButton.widthAnchor.constraint(equalToConstant: 20),
            self.searchButton.heightAnchor.constraint(equalToConstant: 20),
            
            
            
        ])
    }
    
}
