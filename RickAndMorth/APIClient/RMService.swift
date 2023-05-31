//
//  RMService.swift
//  RickAndMorth
//
//  Created by 曲奕帆 on 2023/5/29.
//

import Foundation


/// 主要的API Service，取得Rick and Morty的資料。
///
/// -Authors: Tomtom Chu
/// -Date: 2023.5.29
final class RMService {
    static let shared = RMService()
    
    private init(){
        
    }
    
    /// 打API。
    ///
    /// - parameters:
    ///     - request: Request 實體。
    ///     - type: 我們預期傳回來的物件的型態。
    ///     - completion: Callback with data or error
    /// -Authors: Tomtom Chu
    /// -Date: 2023.5.29
    public func execute<T: Codable>(
        _ request: RMRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>)-> Void
    ){
        
    }
}
