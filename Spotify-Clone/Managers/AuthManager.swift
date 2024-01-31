//
//  AuthManager.swift
//  Spotify-Clone
//
//  Created by Fazlı Altun on 1.01.2024.
//

import Foundation

final class AuthManager {
   
    static let shared = AuthManager()
    
    struct Constants {
        static let clientID = "cfbc3c2d4892412fa5aa68043d93b5b9"
        static let clientSecret = "1c4deec244a54dfaa5a9656c5ab1938b"
        static let tokenAPIURL = "https://accounts.spotify.com/api/token"
    }
    
    private init() {}
    
    public var signInURL: URL? {
        let baseURL = "https://accounts.spotify.com/authorize"
        let redirectURI = "https://github.com/fazlialtunn/Spotify-Clone-Swift"
        let scopes = "user-read-private"
        let string = "\(baseURL)?response_type=code&client_id=\(Constants.clientID)&scope=\(scopes)&redirect_uri=\(redirectURI)&show_dialog=TRUE"
        return URL(string: string)
    }

    var isSignedIn: Bool {
        return false
    }
    
    private var accessToken: String? {
        return nil
    }
    private var refreshToken: String? {
        return nil
    }
    private var expirationDate: Date? {
        return nil
    }
    private var shouldRefreshToken: Bool {
        return false
    }
    public func exchangeCodeForToken(code: String, 
                                     completion: @escaping ((Bool) -> Void)) {
        //GET TOKEN
        guard let url = URL(string: Constants.tokenAPIURL) else {
            return
        }
        
        var components = URLComponents()
        components.queryItems = [
        URLQueryItem(name: "grant_type", value: "authorization_code"),
        URLQueryItem(name: "code", value: code),
        URLQueryItem(name: "redirect_uri", value: "https://github.com/fazlialtunn/Spotify-Clone-Swift"),
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpBody = components.query?.data(using: .utf8)
        
        let basicToken = Constants.clientID+":"+Constants.clientSecret
        let data = basicToken.data(using: .utf8)
        guard let base64String = data?.base64EncodedString() else {
            print("failure to get base64")
            completion(false)
            return
        }
        
        request.setValue("Basic \(base64String)", forHTTPHeaderField: "Authorization")
        
       let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
           guard let data = data, error == nil else {
               completion(false)
               return
           }
           do {
               let result = try JSONDecoder().decode(AuthResponse.self, from: data)
               self?.cacheToken(result: result)
               completion(true)
           } catch {
               completion(false)
               print(error.localizedDescription)
           }
        }
        task.resume()
        
    }
    
    public func refreshAccessToken() {
        
    }
    
    private func cacheToken(result: AuthResponse) {
        
    }
}
