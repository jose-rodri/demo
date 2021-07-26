//
//  HomeInteractor.swift
//  ViperProyectoUdemy
//
//  Created by Jose Leoncio Quispe Rodriguez on 9/22/20.
//  Copyright © 2020 Jose Leoncio Quispe Rodriguez. All rights reserved.
//

import Foundation
import Alamofire


enum  ServiceResult {
    case success(data: Any?)
    case failed(error: String?)
}

typealias ServiceCompletion = (_ result: ServiceResult) -> ()



class HomeInteractor {
//https://randomuser.me/api/?results=5000

    let url = "https://randomuser.me/api/"
}



extension HomeInteractor: HomeUseCaseInteractorProtocol {
    func fetchRequest(count: Int, callback: @escaping ServiceCompletion) {
        
        Alamofire.request(url, method: .get, parameters: ["results": count], encoding: URLEncoding.queryString)
            .responseDecodable {(response: DataResponse<Users>) in
                
                print("\(String(describing: response.request))")
                print("\(String(describing: response.response))")
                 print("\(response.result)")
                
                if let users = response.value {
                    
                    callback(ServiceResult.success(data: users))
                    
                }else {
                    callback(ServiceResult.failed(error: "Ha fallado el JSON"))
                }
        }
    }
    
   
    
    
}










extension DataRequest {
    

    func newJSONDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
            decoder.dateDecodingStrategy = .iso8601
        }
        return decoder
    }

    func newJSONEncoder() -> JSONEncoder {
        let encoder = JSONEncoder()
        if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
            encoder.dateEncodingStrategy = .iso8601
        }
        return encoder
    }
    
    fileprivate func decodableResponseSerializer<T: Decodable>() -> DataResponseSerializer<T> {
        return DataResponseSerializer { _, response, data, error in
            guard error == nil else { return .failure(error!) }

            guard let data = data else {
                return .failure(AFError.responseSerializationFailed(reason: .inputDataNil))
            }

            return Result { try self.newJSONDecoder().decode(T.self, from: data) }
        }
    }

    @discardableResult
    fileprivate func responseDecodable<T: Decodable>(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
        return response(queue: queue, responseSerializer: decodableResponseSerializer(), completionHandler: completionHandler)
    }

    @discardableResult
    func responseUsers(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<Users>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}







