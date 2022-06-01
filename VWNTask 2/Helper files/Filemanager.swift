//
//  Filemanager.swift
//  VWNTask
//
//  Created by Amirkhouzam on 01/05/2022.
//

import UIKit

class filemanager {
    
    static let shared = filemanager()
    
    func documentDirectoryPath() -> URL? {
        let path = FileManager.default.urls(for: .documentDirectory,
                                            in: .userDomainMask)
        return path.first
    }
    func saveJpg(_ image: UIImage , pathstring : String) {
        if let jpgData = image.jpegData(compressionQuality: 0.5),
            let path = documentDirectoryPath()?.appendingPathComponent(pathstring) {
            try? jpgData.write(to: path)
        }
    }
    func readimage(path : String) -> UIImage{
        let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
        let nsUserDomainMask    = FileManager.SearchPathDomainMask.userDomainMask
        let paths               = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
        if let dirPath          = paths.first
        {
           let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent(path)
            guard let image    = UIImage(contentsOfFile: imageURL.path) else {return UIImage()}
           return image
        }else{
            return UIImage()
        }
    }
}
