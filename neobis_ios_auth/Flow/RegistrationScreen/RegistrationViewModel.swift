//
//  RegistrationViewModel.swift
//  neobis_ios_auth
//
//  Created by Sultan on 27/9/23.
//

import UIKit

protocol RegisterProtocol {
    var isRegister: Bool { get }
    var registerResult: ((Result<Data, Error>) ->Void)? { get set }
    
    func register(email: String)
}

class RegistrationViewModel : RegisterProtocol {
    var isRegister: Bool = false
    var registerResult: ((Result<Data, Error>) -> Void)?
    
    let apiService : APIService
    
    init() {
        self.apiService = APIService()
    }
    
    func register(email: String) {
        let parameters: [String: Any] = ["email": email]
        
        apiService.post(endpoint: "register/", parameters: parameters) { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case.success(let data):
                    let dataString = String(data: data, encoding: .utf8)
                    print("Data received: \(dataString ?? "nil")")
                    self?.isRegister = true
                    self?.registerResult?(.success(data))
                    print(data)
                case.failure(let error):
                    print(error)
                    let errorMessage = "Failed register number: \(error.localizedDescription)"
                    print(errorMessage)
                    self?.registerResult?(.failure(error))
                    print(error)
                }
            }
        }
    }
    
    
}
