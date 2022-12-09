//
//  File.swift
//  
//
//  Created by Rezki Pratama on 30/11/22.
//

import Foundation
 
public protocol Mapper {
    associatedtype Response
    associatedtype Entity
    associatedtype Domain
    
    func transformResponseToEntity(response: Response) -> Entity
    func transformEntityToDomain(entity: Entity) -> Domain
    func transformResponseToDomain(response: Response) -> Domain
    func transformDomainToEntity(domain: Domain) -> Entity
}
