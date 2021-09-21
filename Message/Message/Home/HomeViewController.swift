//
//  HomeViewController.swift
//  Message
//
//  Created by Paulo Rodrigues on 21/09/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    var homeScreen: HomeScreen?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.homeScreen = HomeScreen()
        self.view = self.homeScreen
    }

}
