//
//  File.swift
//  
//
//  Created by Rezki Pratama on 30/11/22.
//

import Combine
 
public protocol LocalDataSource {
    associatedtype Request
    associatedtype Response
    
    func list(search: String) -> AnyPublisher<[Response], Error>
    func addAll(entities: [Response]) -> AnyPublisher<Bool, Error>
    func add(entities: Response) -> AnyPublisher<Bool, Error>
    func get(id: String) -> AnyPublisher<Response, Error>
    func update(id: Int, entity: Response) -> AnyPublisher<Bool, Error>
    func delete(entities: Response) -> AnyPublisher<Bool, Error>
  
}
