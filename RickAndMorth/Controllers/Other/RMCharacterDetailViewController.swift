//
//  RMCharacterDetailViewController.swift
//  RickAndMorth
//
//  Created by 曲奕帆 on 2023/6/18.
//

import UIKit

/// 顯示單一個角色資訊的頁面。
///
/// -Authors: Tomtom Chu
/// -Date: 2023.6.18
final class RMCharacterDetailViewController: UIViewController {
    
    private let viewModel: RMCharacterDetailViewViewModel
    
    init(viewModel: RMCharacterDetailViewViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = viewModel.title

    }

}
