//
//  PokemonDetailsViewController.swift
//  pokedex
//
//  Created by karma on 21/10/2022.
//

import UIKit
import Kingfisher

class PokemonDetailsViewController: UIViewController {
    
    private let iconImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    private let typeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    // MARK: - Properties
    var detailUrl: String?
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = name
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupUI()
    }
    
    private func setup() {
        view.addSubview(iconImageView)
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = false
        
        fetchData()
    }
    
    private func setupUI() {
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            iconImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            iconImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
//            iconImageView.heightAnchor.constraint(equalToConstant: view.width - 40),
            iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor,multiplier: 1/1)
        ])
    }
    
    private func fetchData() {
        NetworkService.getWithURL(urlString: detailUrl) { [weak self] result in
            switch result{
            case .success(let model):
                print(model.name)
                DispatchQueue.main.async {
                    self?.setImage(model: model)
                }
            case .failure(_):
                print("error fetching details")
            }
        }
    }
    
    private func setImage(model: PokemonDetail) {
        iconImageView.kf.setImage(with: URL(string: model.sprites.other?.officialArtwork.frontDefault ?? ""))
    }
    
}
