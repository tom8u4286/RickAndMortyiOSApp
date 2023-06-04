//
//  Extensions.swift
//  RickAndMorth
//
//  Created by 曲奕帆 on 2023/6/4.
//

import UIKit


extension UIView {
    func addSubviews(_ views: UIView...){
        views.forEach({
            addSubview($0)
        })
    }
}
