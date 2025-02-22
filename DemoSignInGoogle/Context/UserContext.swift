//
//  UserContext.swift
//  DemoSignInGoogle
//
//  Created by Lê Tiến Đạt on 22/2/25.
//

import Foundation

class UserContext {
    static let shared = UserContext()
    
    func fetchUser() -> User? {
        do {
            guard let userData = UserDefaults.standard.data(forKey: "user") else { return nil }
            let userDecode = try JSONDecoder().decode(User.self, from: userData)
            
            return userDecode
        } catch {
            print("Could not decode user")
            
            return nil
        }
    }
    
    func saveUser(_ user: User) {
        do {
            let userEncode = try JSONEncoder().encode(user)
            UserDefaults.standard.set(userEncode, forKey: "user")
        } catch {
            print("Could not encode user")
        }
    }
}
