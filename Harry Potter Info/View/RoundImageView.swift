//
//  RoundImageView.swift
//  Harry Potter Info
//
//  Created by Markus Varner on 9/8/18.
//  Copyright © 2018 Markus Varner. All rights reserved.
//

import UIKit

class RoundImageView: UIImageView {
    
    
    override func awakeFromNib() {
        setUpView()
    }
    func setUpView(){
        DispatchQueue.main.async {
            self.layer.cornerRadius = self.frame.width / 2
            self.clipsToBounds = true
            self.layer.borderWidth = 1.3
            self.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    
}
