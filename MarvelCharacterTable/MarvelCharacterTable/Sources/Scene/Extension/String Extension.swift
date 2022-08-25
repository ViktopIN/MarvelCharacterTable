//
//  String Extension.swift
//  MarvelCharacterTable
//
//  Created by Виктор on 23/08/2022.
//

import Foundation
import CryptoKit

extension String {
    public func getMdFive() -> String  {
        return Insecure.MD5.hash(data: self.data(using: .utf8)!).map { String(format: "%02hhx", $0) }.joined()
    }
}

