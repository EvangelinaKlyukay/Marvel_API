//
//  CharacterTableViewCell.swift
//  Marvel_API
//
//  Created by Евангелина Клюкай on 08.09.2023.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameCharacter: UILabel!
    
    var character: CharacterModel? {
        
        didSet {
            
            nameCharacter.text = character?.name
            
        }
    }
}
