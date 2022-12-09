//
//  File.swift
//  
//
//  Created by Rezki Pratama on 30/11/22.
//

import Combine
 
public protocol DataSource {
    associatedtype Request
    associatedtype Response
    
    func execute(request: Request?) -> AnyPublisher<Response, Error>
}
