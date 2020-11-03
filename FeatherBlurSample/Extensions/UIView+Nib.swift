//
//  UIView+Nib.swift
//  FeatherBlurSample
//
//  Created by Кирилл Сидоров on 04.11.2020.
//

import UIKit

extension UIView {
    static func loadFromNib<T>() -> T {
        let bundle = Bundle(for: self)
        let nib = bundle.loadNibNamed(String(describing: self), owner: self, options: nil)
        return nib!.first as! T
    }
}
