//
//  ComicsModel.swift
//  Marvel_API
//
//  Created by Евангелина Клюкай on 01.08.2022.
//

import UIKit

struct ComicsModel: Decodable
{
    let id: Int?
    let title: String?
    let description: String?
    let thumbnail: HeroThumbnail
}

struct HeroThumbnail: Decodable
{
    let path: String
    let `extension`: String
}
