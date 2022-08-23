//
//  CharacterModel.swift
//  MarvelCharacterTable
//
//  Created by Виктор on 23/08/2022.
//

import Foundation

struct Character: Decodable {
    let id: Int?
    let name: String?
    let descriptioin: String?
    let thumbnail: Image?
    let stories: StoryList?
}

struct Image: Decodable {
    let path: String?
    let extens: String?
    
    enum CodingKeys: String, CodingKey {
        case path
        case extens = "extension"
    }
}

struct StoryList: Decodable {
    let returned: Int?
    let items: StorySummary?
}

struct StorySummary: Decodable {
    let name: String?
    let type: String?
}
