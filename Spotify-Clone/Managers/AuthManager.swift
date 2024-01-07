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
    }
    
    public func refreshAccessToken() {
        
    }
    
    private func cacheToken() {
        
    }
}
