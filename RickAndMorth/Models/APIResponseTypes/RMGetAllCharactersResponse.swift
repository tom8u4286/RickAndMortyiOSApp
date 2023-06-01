//
//  RMGetCharactersResponse.swift
//  RickAndMorth
//
//  Created by 曲奕帆 on 2023/6/1.
//

import Foundation


/// 這是GetAllChar API會取得的JSON結構。
///
/// -Authors: Tomtom Chu
/// -Date: 2023.6.1
struct RMGetAllCharactersResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    
    let info: Info
    let results: [RMCharacter]
}
