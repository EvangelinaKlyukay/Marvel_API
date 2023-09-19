//
//  CharacterTableViewCell.swift
//  Marvel_API
//
//  Created by Евангелина Клюкай on 08.09.2023.
//

import UIKit
import Kingfisher

class CharacterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var nameCharacter: UILabel!
    
    var character: CharacterModel? {
        didSet {
            //let url = URL(string: "https://app.surprizeme.ru/media/store/1186_i1KaYnj_8DuYTzc.jpg")
            //characterImageView.kf.setImage(with: url)
            nameCharacter.text = character?.name
        }
    }
}
