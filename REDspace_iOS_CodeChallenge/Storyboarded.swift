//
//  Storyboarded.swift
//  REDspace_iOS_CodeChallenge
//
//  Created by Harsh on 19/05/22.
//

import Foundation

import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {

        // this splits by the dot and uses everything after, giving "MyViewController"
        let className = NSStringFromClass(self).components(separatedBy: ".")[1]

        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)

        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
