//
//  File.swift
//  
//
//  Created by Rezki Pratama on 30/11/22.
//

import RealmSwift
 
extension Results {
 
  public func toArray<T>(ofType: T.Type) -> [T] {
    var array = [T]()
    for index in 0 ..< count {
      if let result = self[index] as? T {
        array.append(result)
      }
    }
    return array
  }
}
