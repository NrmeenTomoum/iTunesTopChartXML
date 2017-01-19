//
//  ActivityIndicatorProtocol.swift
//  iTunesTopChart
//
//  Created by NrmeenTomoum on 1/18/17.
//  Copyright © 2017 NrmeenTomoum. All rights reserved.
//

import Foundation
import UIKit

protocol ActivityIndicatorProtocol {
    var activityIndicator: UIActivityIndicatorView! { get set }
    
    func displayActivityIndicator()->()
    func hideActivityIndicator()->()
}

extension ActivityIndicatorProtocol
{
    func displayActivityIndicator()->(){
        if activityIndicator == nil {
            return
        }
        
        UIApplication.shared.beginIgnoringInteractionEvents()
        activityIndicator.startAnimating();
    }
    
    func hideActivityIndicator()->(){
        if activityIndicator == nil {
            return
        }
        
        UIApplication.shared.endIgnoringInteractionEvents()
        activityIndicator.stopAnimating();
    }
    
}
