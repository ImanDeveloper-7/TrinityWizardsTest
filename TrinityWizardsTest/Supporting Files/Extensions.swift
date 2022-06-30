//
//  Extensions.swift
//  TrinityWizardsTest
//
//  Created by Iman Zabihi on 30/06/2022.
//

import UIKit

extension UIImageView {
    
    func makeRounded() {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}

