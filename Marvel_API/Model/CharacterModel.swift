//
//  ComicsModel.swift
//  Marvel_API
//
//  Created by Евангелина Клюкай on 01.08.2022.
//

import UIKit

class CharacterModel: NSObject {
    let id: Int?
    let name: String?
    let descriptionCharacter: String?
    
    //let thumbnail: HeroThumbnail
    
    init(data: [String: Any]) {
        self.id = data["id"] as? Int ?? 0
        self.name = data["name"] as? String ?? ""
        self.descriptionCharacter = data["description"] as? String ?? ""
        
        //self.thumbnail = data["thumbnail"] as? HeroThumbnail
    }
}

struct HeroThumbnail: Decodable {
    let path: String?
    let `extension`: String?
    
    init(data: [String: Any]) {
        self.path = data["path"] as? String ?? ""
        self.`extension` = data["extension"] as? String ?? ""
    }
}
