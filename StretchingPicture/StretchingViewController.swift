//
//  StretchingViewController.swift
//  StretchingPicture
//
//  Created by Александр Горелкин on 19.09.2023.
//

import UIKit


final class StretchingViewController: UIViewController {
    
    private static var defaultImageHeight: CGFloat = 270
    
    private lazy var strecthImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        return imageView
    }()
    
    private lazy var mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height * 2)
        scrollView.delegate = self
        return scrollView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(mainScrollView)
        mainScrollView.addSubview(strecthImageView)
        mainScrollView.frame = view.bounds
        strecthImageView.frame = CGRect(
            x: .zero,
            y: -mainScrollView.safeAreaInsets.top,
            width: mainScrollView.frame.width,
            height: Self.defaultImageHeight
        )
    }
    
}

extension StretchingViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scroll = scrollView.contentOffset.y + scrollView.contentInset.top
        if scroll < 0 {
            strecthImageView.frame = CGRect(x: .zero, y: -scrollView.contentInset.top + scroll, width: scrollView.frame.width, height: Self.defaultImageHeight + abs(scroll))
        }
        scrollView.verticalScrollIndicatorInsets.top = strecthImageView.frame.height - scrollView.safeAreaInsets.top
    }
    
}

