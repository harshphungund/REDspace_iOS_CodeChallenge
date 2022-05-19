//
//  ImageCaching.swift
//  REDspace_iOS_CodeChallenge
//
//  Created by Harsh on 19/05/22.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        self.image = nil
        if let imageToCache = imageCache.object(forKey: url.absoluteString as NSString) {
            self.image = imageToCache
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                return
            }
            DispatchQueue.main.async {
                let imageToCache = UIImage(data: data!)
                imageCache.setObject(imageToCache!, forKey: url.absoluteString as NSString)
                self.image = imageToCache
            }
        }
        task.resume()
    }
}
