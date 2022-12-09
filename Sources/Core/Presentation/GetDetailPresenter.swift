//
//  File.swift
//
//
//  Created by Rezki Pratama on 30/11/22.
//

import Foundation
import SwiftUI
import Combine
 
public class GetDetailPresenter<Request, Response, Interactor: UseCase>: ObservableObject where Interactor.Request == Request, Interactor.Response == Response {
    
    private var cancellables: Set<AnyCancellable> = []
    
    private let _useCase: Interactor
    
    @Published public var detail: Response?
    @Published public var errorMessage: String = ""
    @Published public var resourceState: ResourceState = .initial
  
    @Published public var showBottomSheet: Bool = false
    
    public init(useCase: Interactor) {
        _useCase = useCase
    }
    
    public func getDetail(from id: String) {
        self.resourceState = .loading
        _useCase.execute(request: id as? Request)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.resourceState = .error
                    self.errorMessage = error.localizedDescription
                case .finished:
                    self.resourceState = .success
                }
            }, receiveValue: { detail in
                self.detail = detail
            })
            .store(in: &cancellables)
    }
}
