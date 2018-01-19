//
//  Alert.swift
//  VideoPlayer
//
//  Created by Cheng-Shan Hsieh on 2018/1/19.
//  Copyright © 2018年 HsinTing Hsieh. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String, handler: ((UIAlertAction) -> Swift.Void)? = nil) {
        
        DispatchQueue.main.async { [unowned self] in
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: handler))
            
            self.present(alertController, animated: true, completion: nil)
            
        }
    }
}
