//
//  Alert.swift
//  Message
//
//  Created by Paulo Rodrigues on 20/09/21.
//

import Foundation
import UIKit

class Alert: NSObject {
    
    var controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func getAlert(title: String, message: String, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "OK", style: .cancel) { action in
            completion?()
        }
        
        alertController.addAction(cancelAction)
        
        self.controller.present(alertController, animated: true)
        
    }
    
}
