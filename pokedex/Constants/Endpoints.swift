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
    case pokemon(id: Int?)
//    case detail(url: String?)
}

extension Endpoints {
    
    var path: String {
        switch self {
        case .pokemon(let id):
            return "pokemon\(id == nil ? "" : "/\(id ?? 0)")"
        }
    }
    
    var url: URL {
        return URL(string: "\(API.baseURL)\(path)")!
    }
    
}
