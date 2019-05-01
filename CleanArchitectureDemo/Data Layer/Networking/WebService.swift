//
//  WebService.swift
//  CleanArchitectureDemo
//
//  Created by Nikola Matijevic on 29/04/2019.
//  Copyright © 2019 Nikola Matijevic. All rights reserved.
//


import Foundation

protocol WebService: class {
    func execute<T: Decodable>(_ request: URLRequest, callback: @escaping (Response<T>) -> Void)
}

class WebServiceProvider: WebService {
    private let session: NetworkSession

    init(session: NetworkSession) {
        self.session = session
    }

    func execute<T: Decodable>(_ request: URLRequest, callback: @escaping (Response<T>) -> Void) {
        session.perform(with: request) { [weak self] (data, response, error) in
            self?.handleResponse(data, httpResponse: response as? HTTPURLResponse, error: error, callback: callback)
        }
    }

    private func handleResponse<T: Decodable>(_ data: Data?, httpResponse: HTTPURLResponse?, error: Error?, callback: (Response<T>) -> Void) {
        if let error = error {
            callback(.error(error))
        } else if let data = data  {
            if T.self == Data.self {
                callback(.success(data as! T))
                return
            }

            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                callback(.success(result))
            } catch let error {
                callback(.error(error))
            }
        } else {
            callback(.error(WebServiceError.ambigousResponse))
        }
    }
}

enum WebServiceError: Error {
    case ambigousResponse
}

