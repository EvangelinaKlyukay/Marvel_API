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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        charactersTableView.dataSource = self
        charactersTableView.delegate = self
        
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
    }
}

extension CharactersTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharactersCell", for: indexPath)
        (cell as? CharacterTableViewCell)?.character = characters[indexPath.row]
        return cell
    }
    
    
}
