//
//  DescriptionCharacterViewController.swift
//  Marvel_API
//
//  Created by Евангелина Клюкай on 20.09.2023.
//

import UIKit
import Kingfisher


class DescriptionCharacterViewController: UIViewController {
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var nameCharacterLabel: UILabel!
    @IBOutlet weak var descriptionCharacterLabel: UILabel!
    
    var character: CharacterModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadInformationAboutCharacter()
        
    }
    
    func loadInformationAboutCharacter() {
   
        if let character = character {
            let url = URL(string: character.image?.url ?? "")
            guard let url = url else { return }
            var comps = URLComponents(url: url, resolvingAgainstBaseURL: false)!
            comps.scheme = "https"
            let https = comps.url!
            characterImage.kf.setImage(with: https)
            nameCharacterLabel.text = character.name
            if character.descriptionCharacter == "" {
                descriptionCharacterLabel.text = "No description"
            } else {
                descriptionCharacterLabel.text = character.descriptionCharacter
            }
           
        }
        
    }
    
}
