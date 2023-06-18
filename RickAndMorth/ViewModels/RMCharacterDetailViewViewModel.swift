//
//  RMCharacterDetailViewViewModel.swift
//  RickAndMorth
//
//  Created by 曲奕帆 on 2023/6/18.
//

import Foundation

final class RMCharacterDetailViewViewModel {
    private let character: RMCharacter
    
    init(character: RMCharacter) {
        self.character = character
    }
    
    public var title: String {
        character.name.uppercased()
    }
}
