//
//  PokemonListTableViewCell.swift
//  pokedex
//
//  Created by karma on 19/10/2022.
//

import UIKit

class PokemonListTableViewCell: UITableViewCell {

    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 1
        label.backgroundColor = .systemMint
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 1
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(iconImageView)
        contentView.addSubview(label)
        contentView.addSubview(subTitleLabel)
        contentView.clipsToBounds = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 20),
            iconImageView.widthAnchor.constraint(equalToConstant: 100),
            iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor, multiplier: 1),
            iconImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 20),
            label.heightAnchor.constraint(equalToConstant: 50),
            
//            subTitleLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            subTitleLabel.leadingAnchor.constraint(equalTo: label.leadingAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: label.trailingAnchor),
            subTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            subTitleLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configure(with model: Pokemon) {
        label.text = model.name
        subTitleLabel.text = "hola"
        iconImageView.image = UIImage(named: "placeholder")
    }
    
}
