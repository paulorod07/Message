//
//  HomeViewController.swift
//  Message
//
//  Created by Paulo Rodrigues on 21/09/21.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {
    
    var auth: Auth?
    var firestore: Firestore?
    var userId: String?
    var userEmail: String?
    
    var contactScreen: Bool?
    var alert: Alert?
    
    var homeScreen: HomeScreen?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = CustomColor.appLight
        self.configHomeView()
        self.configCollectionView()
        self.configAlert()
    }
    
    override func loadView() {
        self.homeScreen = HomeScreen()
        self.view = self.homeScreen
    }
    
    private func configHomeView() {
        self.homeScreen?.navigationView.delegate(delegate: self)
    }
    
    private func configCollectionView() {
        self.homeScreen?.collectionViewDelegate(delegate: self, dataSource: self)
    }
    
    private func configAlert() {
        self.alert = Alert(controller: self)
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("indexPath", indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }
    
}

extension HomeViewController: NavigationViewProtocol {
    
    func typeScreenMessage(type: typeConversationOrContact) {
        
        switch type {
        case .contact:
            self.contactScreen = true
        case .conversation:
            self.contactScreen = false
        }
        
    }
    
    
}
