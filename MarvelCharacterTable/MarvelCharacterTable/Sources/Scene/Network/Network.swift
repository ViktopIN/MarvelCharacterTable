//
//  Network.swift
//  MarvelCharacterTable
//
//  Created by Виктор on 23/08/2022.
//

import Foundation
import Alamofire

class MarvelNetwork {

    private func defaultUrl() -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "gateway.marvel.com"
        components.path = "/v1/public/characters"
        let queryRequest = URLQueryItem(name: "nameStartsWith", value: "spider")
        let queryTs = URLQueryItem(name: "ts", value: hashData.timeStamp)
        let queryApikey = URLQueryItem(name: "apikey", value: hashData.marvelPublicKey)
        let queryHash = URLQueryItem(name: "hash", value: hashData.hashValue)
        components.queryItems = [queryRequest, queryTs, queryApikey, queryHash]
        
        let url = components.url
        
        print(url as Any)
        
        return url!
    }

    func fetchCharacter(completion: @escaping (DataMarvel?, _ error: String?) -> Void) {
        AF.request(defaultUrl())
            .responseDecodable(of: DataMarvel.self, queue: .global()) { (response) in
                if let error = response.error {
                    completion(nil, error.localizedDescription)
                }

                if let statusCode = response.response?.statusCode, statusCode == 200 {
                    print("Marvel Api Server status -  \(statusCode)")
                } else if let statusCode = response.response?.statusCode {
                    completion(nil, String(statusCode))
                    return
                }

                guard let data = response.value else {
                    completion(nil, "No data")
                    return
                }

                completion(data, nil)
            }
    }
}

//MARK: - NetworkConstants -

extension MarvelNetwork {
    enum hashData {
        static let timeStamp = "5"
        static let marvelPublicKey = "6bf7cc2cb014568bc3f57e8181392810"
        static let marvelPrivateKey = "d5cbbc5c81c6b7f9de975af94dbac807ebf3ff3d"
        static let hashValue = (timeStamp +
                                marvelPrivateKey +
                                marvelPublicKey).getMdFive()
    }
}
