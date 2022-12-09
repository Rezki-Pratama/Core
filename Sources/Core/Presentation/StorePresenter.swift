//
//  File.swift
//
//
//  Created by Rezki Pratama on 30/11/22.
//

import Foundation
import SwiftUI
import Combine
 
public class StorePresenter<Request, Response, Interactor: UseCase>: ObservableObject where Interactor.Request == Request, Interactor.Response == Response {
    
    private var cancellables: Set<AnyCancellable> = []
    
    private let _useCase: Interactor
    
    @Published public var successMessage: String = ""
    @Published public var showingAlert: Bool = false
    @Published public var errorMessage: String = ""
    @Published public var resourceState: ResourceState = .initial
  
    @Published public var isFavourite: Bool = false
  
    @Published public var showBottomSheet: Bool = false
    
    public init(useCase: Interactor) {
        _useCase = useCase
    }
    
    public func store(request: Request,  completion: @escaping ((Bool)->Void)) {
      self.resourceState = .loading
      _useCase.execute(request: request)
        .receive(on: RunLoop.main)
        .sink(receiveCompletion: { completion in
            switch completion {
            case .failure:
              self.resourceState = .error
              self.errorMessage = String(describing: completion)
            case .finished:
              self.resourceState = .success
            }
          }, receiveValue: { message in
            completion(true)
            self.successMessage = message as! String
            self.showingAlert = true
          })
          .store(in: &cancellables)
  }
}
