//
//  RMEndpoint.swift
//  RickAndMorth
//
//  Created by 曲奕帆 on 2023/5/29.
//

import Foundation

@frozen enum RMEndpoint: String {
    /// 取得character資訊的Endpoint
    case character
    /// 取得location資訊的Endpoint
    case location
    /// 取得episode資訊的Endpoint
    case episode
}
