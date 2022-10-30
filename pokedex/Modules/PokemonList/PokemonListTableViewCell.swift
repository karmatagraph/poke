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
        label.font = UIFont.scriptFont(size: 24)
//        label.backgroundColor = .systemMint
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.scriptFont(size: 18)
        label.numberOfLines = 1
        return label
    }()
    
//    private let iconImageView: UIImageView = {
//        let imgView = UIImageView()
//        imgView.contentMode = .scaleAspectFit
//        return imgView
//    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        contentView.addSubview(iconImageView)
        contentView.addSubview(label)
        contentView.addSubview(subTitleLabel)
        contentView.clipsToBounds = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
//            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
//            iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 20),
//            iconImageView.widthAnchor.constraint(equalToConstant: 100),
//            iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor, multiplier: 1),
//            iconImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 20),
//            label.bottomAnchor.constraint(equalTo: subTitleLabel.topAnchor, constant: ),
//            label.heightAnchor.constraint(equalToConstant: 50),
            
            subTitleLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5),
            subTitleLabel.leadingAnchor.constraint(equalTo: label.leadingAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: label.trailingAnchor),
            subTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
//            subTitleLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configure(with model: Pokemon) {
        label.text = model.name.uppercasingFirst
//        subTitleLabel.text = 
        self.layoutIfNeeded()
//        iconImageView.image = UIImage(named: "placeholder")
    }
    
}
