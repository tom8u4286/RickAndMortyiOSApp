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
    /// -Authors: Tomtom Chu
    /// -Date: 2023.5.29
    public func execute(_ request: RMRequest, completion: @escaping ()-> Void){
        
    }
}
