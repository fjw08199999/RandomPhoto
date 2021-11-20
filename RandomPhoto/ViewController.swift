//
//  ViewController.swift
//  RandomPhoto
//
//  Created by fred fu on 2021/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    func getRandomPhoto() {
        
        for image in randomPhotoImageOutlet {
            //隨機產生圖片API
            let urlStr = "https://picsum.photos/200/300"
            //解析URL
            let url = URL(string: urlStr)
            if let url = url {
            //設定在非主執行緒執行
                URLSession.shared.dataTask(with: url) { data, response, error in
                    if let data = data {
            //將畫面相關功能放置主執行緒執行
                        DispatchQueue.main.async {
                            image.image = UIImage(data: data)
                        }
                    }
            //啟動URLSession
                }.resume()
            }
        }
    }
    

    @IBOutlet var randomPhotoImageOutlet: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for randomPhotoImage in randomPhotoImageOutlet {
            randomPhotoImage.image = UIImage(systemName: "music.house")
        }
        
    }
    
    @IBAction func randomButtonAction(_ sender: Any) {
        getRandomPhoto()
    }
    
}

