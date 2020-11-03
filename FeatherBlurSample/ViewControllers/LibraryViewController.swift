//
//  LibraryViewController.swift
//  FeatherBlurSample
//
//  Created by Кирилл Сидоров on 04.11.2020.
//

import UIKit

class LibraryViewController: UIViewController {
    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet private var verticalStack: UIStackView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    override func viewDidLoad() {
        scrollView.contentInset = .init(top: 64, left: 0, bottom: 0, right: 0)
        addFeatherBlurView()
        fillWithIcons()
    }
    
    func addFeatherBlurView() {
        let featherView = FeatherBlurView.init()
        featherView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(featherView)
        [
            featherView.topAnchor.constraint(equalTo: view.topAnchor),
            featherView.leftAnchor.constraint(equalTo: view.leftAnchor),
            featherView.rightAnchor.constraint(equalTo: view.rightAnchor),
            featherView.heightAnchor.constraint(equalToConstant: 104)
        ].forEach { $0.isActive = true }
        
        let field = makeSearchFieldView()
        featherView.addSubview(field)
        [
            field.widthAnchor.constraint(equalTo: featherView.widthAnchor,
                                         multiplier: 0.8, constant: 1),
            field.centerXAnchor.constraint(equalTo: featherView.centerXAnchor),
            field.centerYAnchor.constraint(equalTo: featherView.centerYAnchor)
        ].forEach { $0.isActive = true }
    }
    
    func makeSearchFieldView() -> UIView {
        let view = SearchTextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }
    
    func fillWithIcons() {
        icons
            .chunked(into: 4)
            .chunked(into: 2)
            .map { $0.map(makePodViewWithIcons) }
            .map(UIStackView.init)
            .forEach(verticalStack.addArrangedSubview)
    }
    
    func makePodViewWithIcons(icons: [UIImage]) -> UIView {
        let view: PodLibraryView = .loadFromNib()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.configure(with: icons)
        return view
    }
}
