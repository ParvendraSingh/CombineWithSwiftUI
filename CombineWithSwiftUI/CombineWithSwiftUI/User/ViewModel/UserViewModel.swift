//
//  UserViewModel.swift
//  CombineWithSwiftUI
//
//  Created by Parvendra Kumar on 25/08/23.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    @Published var userArray: [UserModel] = []
    private var cancellables: Set<AnyCancellable> = []
    @Published var loading = false
    
    
    func getUserData() {
        self.loading = true
        let urlString = API.BaseURL().baseURL + API.ApiEndPoints().userApiEndPoint
        NetworkHandler.shared.getDataFromServer(apiURL: urlString, type: UserModel.self)
            .sink { completion in
                self.loading = false
                switch completion{
                case .finished:
                    print("")
                case .failure(let err):
                    print(err.localizedDescription)
                }
            } receiveValue: { [weak self] apiResponseData in
                self?.userArray = apiResponseData
                self?.loading = false
            }
            .store(in: &cancellables)
    }
}
