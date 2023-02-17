//
//  RedButton.swift
//  Week6Project
//
//  Created by Rania Arbash on 2023-02-17.
//

import UIKit
import CoreGraphics


class RedButton: UIButton {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 2
        layer.backgroundColor = UIColor.red.cgColor
        layer.cornerRadius = layer.frame.height/2
        
        
    }


}
