//
//  ComicsModel.swift
//  Marvel_API
//
//  Created by Евангелина Клюкай on 01.08.2022.
//

import UIKit

class CharacterModel: NSObject {
    
    var id: Int
    let name: String?
    let descriptionCharacter: String?
    let image: Thumbnail?
    
    init(data: [String: Any]) {
        self.id = data["id"] as? Int ?? 0
        self.name = data["name"] as? String ?? ""
        self.descriptionCharacter = data["description"] as? String ?? ""
        
        if let thumbnail = data["thumbnail"] as? [String: Any] {
            self.image = Thumbnail(data: thumbnail)
        } else {
            self.image = nil
        }
    }
}

struct Thumbnail: Codable {
    let path: String
    let ext: String
   
    init(data: [String: Any]) {
        self.path = data["path"] as? String ?? ""
        self.ext = data["extension"] as? String ?? ""
    }
    
    var url: String {
        return "\(path).\(ext)"
    }
    
    enum CodingKeys: String, CodingKey{
        case ext = "extension"
        case path
    }
 
}
