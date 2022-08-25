//
//  NavigationBar Extension.swift
//  MarvelCharacterTable
//
//  Created by Виктор on 25/08/2022.
//

import UIKit

extension UINavigationBar {
    open override func layoutSubviews() {
        super.layoutSubviews()
        let navBarHeight: CGFloat = 100
        let heightDelta: CGFloat = UIScreen.main.nativeBounds.height == 2436 ? 44 : 20
        for subview in subviews {
            if String(describing: subview).contains("BarBackground") {
                subview.frame.origin.y = -heightDelta
                subview.frame.size.height = navBarHeight + heightDelta
            }
        }
    }
}
