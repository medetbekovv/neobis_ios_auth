//
//  LoginViewModel.swift
//  neobis_ios_auth
//
//  Created by Sultan on 27/9/23.
//

import UIKit

protocol LoginViewModelProtocol {
    var isLoggedIn: Bool { get }
    var loginResult: ((Result<Data, Error>) ->Void)? { get set }
    
    func login(email: String, password: String)
}

class LoginViewModel: LoginViewModelProtocol {
    var isLoggedIn: Bool = false
    var loginResult: ((Result<Data, Error>) -> Void)?
    
    let apiService: APIService
    
    init() {
        self.apiService = APIService()
    }
    
    func login(email: String, password: String) {
        let parameters: [String: Any] = ["email": email, "password": password]
        
        apiService.post(endpoint: "login", parameters: parameters) { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    let decoder = JSONDecoder()
                    if let tokenResponse = try? decoder.decode(TokenObtainPair.self, from: data){
                        AuthManager.shared.accessToken = tokenResponse.access
                        self?.isLoggedIn = true
                        self?.loginResult?(.success(data))
                    }
                case .failure(let error):
                    print("Fail")
                    self?.isLoggedIn = false
                    self?.loginResult?(.failure(error))
                }
            }
        }
    }
}
