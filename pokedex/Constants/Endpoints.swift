//
//  Endpoints.swift
//  pokedex
//
//  Created by karma on 19/10/2022.
//

import Foundation

struct API {
    static let baseURL = "https://pokeapi.co/api/v2/"
}

protocol Endpoint {
    var path: String { get }
    var url: URL { get }
}

enum Endpoints {
    case pokemon
}

extension Endpoints {
    
    var path: String {
        switch self {
        case .pokemon:
            return "pokemon"
        }
    }
    
    var url: URL {
        return URL(string: "\(API.baseURL)\(path)")!
    }
    
}
