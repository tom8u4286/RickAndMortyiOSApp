//
//  RMRequest.swift
//  RickAndMorth
//
//  Created by 曲奕帆 on 2023/5/29.
//

import Foundation


/// 單一的API請求物件。
///
/// -Authors: Tomtom Chu
/// -Date: 2023.
final class RMRequest{
    // Base url
    // Endpoint
    // Path components
    // Query parameters
    // https://rickandmortyapi.com/api/character/2
    
    
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    private let endpoint: RMEndpoint
    
    private let pathComponents: Set<String>
    
    private let queryParameters: [URLQueryItem]
    
    /// 產生最後要打API的url。將包含"baseUrl"，"路徑"以及所帶"參數"。
    ///
    /// -Authors: Tomtom Chu
    /// -Date: 2023.5.31
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\($0.value)"
            }).joined(separator: "&")
            
            string += argumentString
            
        }
        
        return string
        
    }
    
    /// 將urlString轉換成URL型別。
    ///
    /// -Authors: Tomtom Chu
    /// -Date: 2023.5.31
    public var url: URL? {
        return URL(string: urlString)
    }
    
    public let httpMethod = "GET"
    
    
    public init(
        endpoint: RMEndpoint,
        pathComponents: Set<String> = [],
        queryParameters: [URLQueryItem] = []
    ){
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    
    
    
    
    
}
