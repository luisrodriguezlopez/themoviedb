//
//  imageExtension.swift
//  themoviedb
//
//  Created by Luis Rodríguez López on 26/09/21.
//

import Foundation
import UIKit

extension UIImageView {
    func setCustomImage(_ imgURLString: String?) {
        let defaultImage = UIImage(named:"icons8-cuenta-de-prueba-48")
        guard let imageURLString = imgURLString else {
            self.image = defaultImage
            return
        }
        DispatchQueue.global().async { [weak self] in
            let data = try? Data(contentsOf: URL(string: imageURLString)!)
            DispatchQueue.main.async {
                self?.image = data != nil ? UIImage(data: data!) : defaultImage
            }
        }
    }
}
