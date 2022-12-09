//
//  File.swift
//  
//
//  Created by Rezki Pratama on 30/11/22.
//

import Foundation
import SwiftUI
import Combine
 
public class GetListPresenter<Request, Response, Interactor: UseCase>: ObservableObject where Interactor.Request == Request, Interactor.Response == [Response] {
    
    private var cancellables: Set<AnyCancellable> = []
    
    private let _useCase: Interactor
    
    @Published public var list: [Response] = []
    @Published public var errorMessage: String = ""
    @Published public var search: String = String()
    @Published public var resourceState: ResourceState = .initial
    
    public init(useCase: Interactor) {
        _useCase = useCase
        $search
          .debounce(for: .milliseconds(800), scheduler: RunLoop.main)
          .removeDuplicates()
          .map({ (string) -> String? in
              return string
          })
          .compactMap{ $0 }
          .sink { (_) in
          } receiveValue: { [self] (searchField) in
            self.getList(search: searchField)
            
          }.store(in: &cancellables)
    }
    
  public func getList(search: String) {
      self.resourceState = .loading
      _useCase.execute(request: search as? Request)
          .receive(on: RunLoop.main)
          .sink(receiveCompletion: { completion in
              switch completion {
              case .failure(let error):
                  self.resourceState = .error
                  self.errorMessage = error.localizedDescription
              case .finished:
                  self.resourceState = .success
              }
          }, receiveValue: { list in
              self.list = list
          })
          .store(in: &cancellables)
  }
  
  public func linkBuilder<Content1: View, Content2: View>(
    title: String,
    destination: () -> Content1,
    @ViewBuilder content: () -> Content2
  ) -> some View {
    ZStack {
      content()
      NavigationLink(
        destination: destination()
          .navigationTitle(Text(title))
      ) {
          EmptyView()
        }
        .opacity(0)
    }
  }
}
