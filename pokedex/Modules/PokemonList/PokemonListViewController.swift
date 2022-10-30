//
//  PokemonListViewController.swift
//  pokedex
//
//  Created by karma on 19/10/2022.
//

import UIKit

class PokemonListViewController: UIViewController {
    
    // MARK: - Outlets
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(PokemonListTableViewCell.self, forCellReuseIdentifier: PokemonListTableViewCell.identifier)
        return tableView
    }()

    // MARK: - Properties
    var model: [Pokemon] = []
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        for family in UIFont.familyNames.sorted() {
          let names = UIFont.fontNames(forFamilyName: family)
          print("Family: \(family) Font names: \(names)")
        }

    }
    
    override func viewDidLayoutSubviews() {
        tableView.frame = view.bounds
    }
    
    // MARK: - Private methods
    private func setup() {
        title = "Pokemons"
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        setupTableView()
        fetchData()
    }
    
    private func fetchData() {
        NetworkService.getApi(with: Endpoints.pokemon(id: nil), expecting: PokemonResponse.self) { result in
            switch result {
            case .success(let model):
                print(model)
                self.model = model.results
                DispatchQueue.main.async {
                    self.tableView.reloadData()
//                    self.tableView.beginUpdates()
//                    self.tableView.setNeedsDisplay()
//                    self.tableView.endUpdates()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func setupTableView() {
//        tableView.backgroundColor = .systemPink
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
    }
    
}

extension PokemonListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let destVC = PokemonDetailsViewController()
        destVC.detailUrl = model[indexPath.row].url
        destVC.name = model[indexPath.row].name
        navigationController?.pushViewController(destVC, animated: true)
    }
    
}

extension PokemonListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PokemonListTableViewCell.identifier, for: indexPath) as? PokemonListTableViewCell else { return UITableViewCell() }
        cell.configure(with: model[indexPath.row])
        return cell
    }
    
}
