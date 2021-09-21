//
//  Extension+String.swift
//  Message
//
//  Created by Paulo Rodrigues on 21/09/21.
//

import UIKit

extension String {
    func size(of font: UIFont) -> CGSize {
        return (self as NSString).size(withAttributes: [NSAttributedString.Key.font : font])
    }
}
