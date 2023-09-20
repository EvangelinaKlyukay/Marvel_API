//
//  CharactersTableViewController.swift
//  Marvel_API
//
//  Created by Евангелина Клюкай on 01.08.2022.
//

import UIKit

class CharactersTableViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var charactersTableView: UITableView!
    
    private var characters: [CharacterModel] = []
    private let network = APIService()
    
    private var isSearching = false
    private var searchingCharacters: [CharacterModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        charactersTableView.dataSource = self
        charactersTableView.delegate = self
        searchBar.delegate = self
        
        fetchData()
    }
    
    private func fetchData() {
        
        network.getCharacters(completion: { (characters) in
            DispatchQueue.main.async {
                self.characters = characters
                self.charactersTableView.reloadData()
            }
        }) { (error) in
            print(error.localizedDescription)
        }
    }
}

extension CharactersTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        charactersTableView.deselectRow(at: indexPath, animated: true)
        
        if isSearching {
            let selectedCountry = searchingCharacters[indexPath.row]
            print(selectedCountry)
        } else {
            let selectedCountry = characters[indexPath.row]
            print(selectedCountry)
        }
        
        self.searchBar.searchTextField.endEditing(true)
    }
}

extension CharactersTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isSearching {
            return searchingCharacters.count
        } else {
            return characters.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharactersCell", for: indexPath)
        
        if isSearching {
            (cell as? CharacterTableViewCell)?.character = searchingCharacters[indexPath.row]
        } else {
            (cell as? CharacterTableViewCell)?.character = characters[indexPath.row]
        }
        return cell
    }
}

extension CharactersTableViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchingCharacters = characters.filter({ ($0.name?.lowercased().prefix(searchText.count))! == searchText.lowercased() })
        isSearching = true
        charactersTableView.reloadData()
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        searchBar.text = ""
        charactersTableView.reloadData()
    }
    
}
