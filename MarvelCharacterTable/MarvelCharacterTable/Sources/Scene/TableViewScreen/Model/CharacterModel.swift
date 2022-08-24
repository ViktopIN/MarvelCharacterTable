//
//  CharacterModel.swift
//  MarvelCharacterTable
//
//  Created by Виктор on 23/08/2022.
//

import Foundation
struct DataMarvel: Decodable {
    let data: Results?
}

struct Results: Decodable {
    let results: [Character]?
}

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
    let items: [StorySummary]?
    let returned: Int?
}

struct StorySummary: Decodable {
    let name: String?
}
