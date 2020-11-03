//
//  PodLibraryView.swift
//  FeatherBlurSample
//
//  Created by Кирилл Сидоров on 04.11.2020.
//

import UIKit

class PodLibraryView: UIView {
    @IBOutlet private var backgroundBlur: UIVisualEffectView!
    @IBOutlet private var images: [UIImageView]!
    
    override func awakeFromNib() {
        backgroundBlur.layer.masksToBounds = true
        backgroundBlur.layer.cornerRadius = 20.0
    }
    
    func configure(with icons: [UIImage]) {
        guard icons.count == 4, images.count == 4 else { return }
        zip(images, icons).forEach { $0.image = $1 }
    }
}
