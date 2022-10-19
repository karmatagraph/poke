//
//  PokemonListViewController.swift
//  pokedex
//
//  Created by karma on 19/10/2022.
//

import UIKit

class PokemonListViewController: UIViewController {

    // MARK: - Properties
    
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Private methods
    private func setup() {
        title = "Pokemons"
        view.backgroundColor = .systemBackground
    }
    
}
