//
//  RMCharacterViewController.swift
//  RickAndMorth
//
//  Created by 曲奕帆 on 2023/5/29.
//

import UIKit

final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Characters"
        
        
        RMService.shared.execute(.listCharactersRequests, expecting: RMGetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                print("Total: " + String(model.info.count))
                print("Page result count:" + String(model.results.count))
            case .failure(let error):
                print(String(describing: error))
            }
        }
        
    }

}
