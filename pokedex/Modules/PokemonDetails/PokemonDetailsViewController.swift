//
//  PokemonDetailsViewController.swift
//  pokedex
//
//  Created by karma on 21/10/2022.
//

import UIKit
import Kingfisher

class PokemonDetailsViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        return scrollview
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var imgBackView: UIView = {
        let view = UIView()
//        view.clipsToBounds = true

        view.setupBorder(width: 1, color: .label, radius: 1)
        view.setShadow()
        view.set(cornerRadius: 10)
//        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    private lazy var versionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = UIFont.scriptFont(size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.backgroundColor = .systemPink
//        label.set(cornerRadius: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
//        label.clipsToBounds = true
        return label
    }()
    
    private lazy var typeLabelButton: UIButton = {
        let button = UIButton(configuration: UIButton.Configuration.plain())
        button.setTitleColor(UIColor.label, for: .normal)
        button.set(cornerRadius: 10)
        button.isUserInteractionEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setContentHuggingPriority(.defaultLow, for: .horizontal)
        button.backgroundColor = .systemRed
        
        return button
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
        contentView.addSubview(imgBackView)
        imgBackView.addSubview(iconImageView)
//        contentView.addSubview(iconImageView)
        contentView.addSubview(versionLabel)
//        contentView.addSubview(typeLabel)
        contentView.addSubview(typeLabelButton)
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
            
            // Image back view
//            imgBackView

            imgBackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            imgBackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            imgBackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
//            iconImageView.heightAnchor.constraint(equalToConstant: view.width - 40),
            imgBackView.heightAnchor.constraint(equalTo: imgBackView.widthAnchor,multiplier: 1/1),
            
            iconImageView.topAnchor.constraint(equalTo: imgBackView.topAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: imgBackView.leadingAnchor),
            iconImageView.trailingAnchor.constraint(equalTo: imgBackView.trailingAnchor),
            iconImageView.bottomAnchor.constraint(equalTo: imgBackView.bottomAnchor),
            iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor,multiplier: 1/1),
            
            // type label
//            typeLabel.topAnchor.constraint(equalTo: versionLabel.bottomAnchor, constant: 40),
//            typeLabel.leadingAnchor.constraint(equalTo: versionLabel.leadingAnchor),
//            typeLabel.trailingAnchor.constraint(lessThanOrEqualTo: versionLabel.trailingAnchor, constant: -20),
//            typeLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 30),
//            typeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            
            // type label button
            typeLabelButton.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 20),
            typeLabelButton.leadingAnchor.constraint(equalTo: iconImageView.leadingAnchor),
            typeLabelButton.trailingAnchor.constraint(equalTo: iconImageView.trailingAnchor),
            typeLabelButton.heightAnchor.constraint(greaterThanOrEqualToConstant: 30),
//            typeLabelButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
            
            versionLabel.topAnchor.constraint(equalTo: typeLabelButton.bottomAnchor, constant: 20),
//            versionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            versionLabel.leadingAnchor.constraint(equalTo: typeLabelButton.leadingAnchor, constant: 20),
            versionLabel.trailingAnchor.constraint(equalTo: typeLabelButton.trailingAnchor, constant: -20),
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
        let types = model.types.map({ $0.type.name.uppercasingFirst })
        typeLabel.text = types.first
        typeLabelButton.setTitle(types.first, for: .normal)
//        versionLabel.text = versions.joined(separator: ", ")
        versionLabel.text = "\(versions.first ?? "") to \(versions.last ?? "")"
        iconImageView.kf.setImage(with: URL(string: model.sprites.other?.officialArtwork.frontDefault ?? ""))
    }
    
}
