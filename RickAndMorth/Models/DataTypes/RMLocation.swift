//
//  RMLocation.swift
//  RickAndMorth
//
//  Created by 曲奕帆 on 2023/5/29.
//

import Foundation

struct RMLocation: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}
