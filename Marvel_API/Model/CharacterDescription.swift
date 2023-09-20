//
//  CharacterDescription.swift
//  Marvel_API
//
//  Created by Евангелина Клюкай on 25.09.2023.
//

import Foundation

class CharacterDescription: NSObject {
    let id: Int
    let name: String
    let descriptionCharacter: String?
    
    init(data: [String: Any]) {
        self.id = data["id"] as? Int ?? 0
        self.name = data["name"] as? String ?? ""
        self.descriptionCharacter = data["description"] as? String ?? ""
    }
}

//struct HeroThumbnail {
//    let path: String
//    let `extension`: String
//    
//    func fullPath() -> String {
//           return "\(path).\(`extension`)"
//       }
//}
