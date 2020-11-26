//
//  DetailViewController.swift
//  youtube-app
//
//  Created by Mohamed Dabbour on 11/26/20.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    //MARK:Properties
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var textView: UITextView!
    
    var videoToDisplay:Video?
    
    //MARK:LifeCycle Hooks
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //Clear fields
        lblDate.text = ""
        lblTitle.text = ""
        textView.text = ""
        
        //Check if there is avideo
        guard videoToDisplay != nil else {
            return
        }
        let embedUrlString = Constants.YT_EMBED_URL + videoToDisplay!.videoId
        
        let url = URL(string: embedUrlString)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        //Title
        lblTitle.text = videoToDisplay!.title
        
        //Date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        lblDate.text = dateFormatter.string(from: videoToDisplay!.published)
       
        //Discription
        textView.text = videoToDisplay?.description
    }
    
    
    
    
}
