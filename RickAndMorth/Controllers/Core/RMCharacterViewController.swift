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
        
        let request = RMRequest(
            endpoint: .character,
            pathComponents: ["1"],
            queryParameters: [
                URLQueryItem(name: "name", value: "rick"),
                URLQueryItem(name: "status", value: "alive")
                
            ]
        )
        
        print(request.url)
        
        RMService.shared.execute(request, expecting: RMCharacter.self) { result in
        }
    }

}
