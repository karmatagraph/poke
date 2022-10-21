//
//  PokemonResponse.swift
//  pokedex
//
//  Created by karma on 19/10/2022.
//

import Foundation

// MARK: - Welcome
struct PokemonResponse: Codable {
    let count: Int
    let next: String
    let previous: String?
    let results: [Pokemon]
}

// MARK: - Result
struct Pokemon: Codable {
    let name: String
    let url: String
}
