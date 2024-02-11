//
//  Playlist.swift
//  Spotify-Clone
//
//  Created by Fazlı Altun on 1.01.2024.
//

import Foundation

struct PlaylistResponse: Codable {
    let items: [Playlist]
}

struct Playlist: Codable {
    let description: String
    let external_urls: [String: String]
    let id: String
    let images: [APIImage]
    let name: String
    let owner: User
}
struct User: Codable {
    let display_name: String
    let external_urls: [String: String]
    let id: String
}
