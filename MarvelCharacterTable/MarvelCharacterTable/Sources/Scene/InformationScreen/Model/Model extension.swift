//
//  Model extension.swift
//  MarvelCharacterTable
//
//  Created by Виктор on 24/08/2022.
//

import Foundation

extension Character {
    func getThumbnailUrl() ->  String? {
        let imageSize = "portrait_uncanny"
        let fullThumbnail = thumbnail?.path?.components(separatedBy: "//")
        let url = "https://" + fullThumbnail![1] + "/\(imageSize)." + (thumbnail?.extens)!
        
        return url
    }
}
