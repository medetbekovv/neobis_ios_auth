//
//  LoginViewModel.swift
//  neobis_ios_auth
//
//  Created by Sultan on 27/9/23.
//

import UIKit

protocol LoginViewModelDelegate: AnyObject {
    var isLoggedIn: Bool { get }
    var loginResult: ((Result<Data, Error>) ->Void)? { get set }
    
    func login(email: String, password: String)
}

class LoginViewModel: LoginViewModelDelegate {
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
                        
                    }
                case .failure(let error):
                    <#code#>
                }
          
//            case .success(let data):
//                let dataString = String(data: data, encoding: .utf8)
//                print("Data received: \(dataString ?? "nil")")
//                let decoder = JSONDecoder()
//                do {
//                    let response = try decoder.decode(TokenObtainPair.self, from: data)
//                    DispatchQueue.main.async {
//                        self?.loginDelegate?.didLogin(user: response)
//                    }
//                } catch {
//                    DispatchQueue.main.async {
//                        self?.loginDelegate?.didFail(with: error)
//                    }
//                }
//            case .failure(let error):
//                DispatchQueue.main.async {
//                    self?.loginDelegate?.didFail(with: error)
//                }
            }

        }
    }
    

    
    
}
