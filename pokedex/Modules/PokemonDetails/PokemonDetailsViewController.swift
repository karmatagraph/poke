//
//  PokemonDetailsViewController.swift
//  pokedex
//
//  Created by karma on 21/10/2022.
//

import UIKit
import Kingfisher

class PokemonDetailsViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        return scrollview
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    private let dummyImg: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    private let versionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = UIFont.scriptFont(size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let typeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
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
        setupConstraints()
    }
    
    private func setup() {
        setupSubviews()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = false
        fetchData()
    }
    
    private func setupSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(iconImageView)
        contentView.addSubview(versionLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            // ScrollView
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            // ContentView
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            iconImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
//            iconImageView.heightAnchor.constraint(equalToConstant: view.width - 40),
            iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor,multiplier: 1/1),

            versionLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 200),
//            versionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            versionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            versionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            versionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant:  -20)
//            versionLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
        ])
    }
    
    private func fetchData() {
        NetworkService.getWithURL(urlString: detailUrl) { [weak self] result in
            switch result{
            case .success(let model):
                print(model.name)
                DispatchQueue.main.async {
                    self?.setDesciption(model: model)
                }
            case .failure(_):
                print("error fetching details")
            }
        }
    }
    
    private func setDesciption(model: PokemonDetail) {
        let versions = model.gameIndices.map({$0.version.name.uppercasingFirst})
        versionLabel.text = versions.joined(separator: ", ")
        iconImageView.kf.setImage(with: URL(string: model.sprites.other?.officialArtwork.frontDefault ?? ""))
    }
    
}
