//
//  ImageLoader.swift
//  Table_with_100_images
//
//  Created by Andrey on 15/08/2019.
//  Copyright © 2019 Andrey Kochetkov. All rights reserved.
//

import Foundation
import UIKit

class ImageLoader {
    func downloadImage(withURL url: URL, forCell cell: UITableViewCell) {
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            //MARK: - Проверка что данные с сервера получены
            guard let imageData = data, error == nil
                else {
                    print(error?.localizedDescription ?? "Something gone wrong while loading data")
                    return
            }
            
            //MARK: - Проверка что полученные данные - изображение
            guard let image = UIImage(data: imageData) else {
                print("Downloaded data is not an image")
                return
            }
            
            DispatchQueue.main.async {
                cell.imageView?.image = image
            }
        }
        task.resume()
    }
    
}
