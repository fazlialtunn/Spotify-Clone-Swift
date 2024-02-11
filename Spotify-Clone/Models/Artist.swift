//
//  Artist.swift
//  Spotify-Clone
//
//  Created by Fazlı Altun on 1.01.2024.
//

import Foundation

struct Artist: Codable {
    let id: String
    let external_urls: [String: String]
    let name: String
    let type: String
}

