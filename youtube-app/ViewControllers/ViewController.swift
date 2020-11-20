//
//  ViewController.swift
//  youtube-app
//
//  Created by Mohamed Dabbour on 11/20/20.
//

import UIKit

class ViewController: UIViewController {
    
    var apiService = ApiService()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiService.getVideos()

    }


}

