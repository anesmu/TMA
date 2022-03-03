//
//  UIImageView+URLSession.swift
//  TMA
//
//  Created by Antonio Espino Muñoz on 3/3/22.
//

import UIKit

extension UIImageView {

    func imageFromServerURL(urlString: String, placeHolderImage: UIImage) {
        if image == nil {
            image = placeHolderImage
        }

        URLSession.shared.dataTask(with: URL(string: urlString)!) { (data, response, error) in
            if error != nil {
                return
            }

            DispatchQueue.main.async {
                guard let data = data else { return }
                self.image = UIImage(data: data)
            }
        }.resume()
    }
}
