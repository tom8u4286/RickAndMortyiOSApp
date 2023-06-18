//
//  RMCharacterStatus.swift
//  RickAndMorth
//
//  Created by 曲奕帆 on 2023/5/29.
//

import Foundation

enum RMCharacterStatus: String, Codable {
    
    /// 此處case所assign的字串，必須要等於API打回來的資料。
    /// (因此"unknown"補能直接改為大寫"Unknown")
    ///
    /// -Authors: Tomtom Chu
    /// -Date: 2023.6.18
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
    
    ///
    ///
    ///
    ///
    /// -Authors: Tomtom Chu
    /// -Date: 2023.
    var text: String {
        switch self {
        case .alive, .dead:
            return rawValue
        case .unknown:
            return "Unknown"
        }
    }
}
