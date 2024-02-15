//
//  RecommendationsResponse.swift
//  Spotify-Clone
//
//  Created by Fazli Altun on 11.02.2024.
//

import Foundation

struct RecommendationsResponse: Codable {
    let tracks: [AudioTrack]
}
