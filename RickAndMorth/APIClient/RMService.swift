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
    
    /// 可能發生的Error種類。
    ///
    /// -Authors: Tomtom Chu
    /// -Date: 2023.6.1
    enum RMServiceError: Error {
        case failToCreateRequest
        case failToGetData
    }
    
    /// 打API。
    /// 其中，execute<T:Codable>的寫法代表，
    /// 這個function可接受一個泛型的參數，而這個參數必須要遵循Codable。
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
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(RMServiceError.failToCreateRequest))
            return
        }
        
        // ⭐️重點！
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            // 檢查: 有回傳資料(data)，error也為nil。
            guard let data = data, error == nil else {
                completion(.failure(error ?? RMServiceError.failToGetData))
                return
            }
            
            // 解碼response
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
        
    }
    
    
    /// 將一個RMRequest轉換為一個URLRequest。
    ///
    /// -Authors: Tomtom Chu
    /// -Date: 2023.6.1
    private func request(from rmRequest: RMRequest) -> URLRequest?{
        guard let url = rmRequest.url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
    }
}
