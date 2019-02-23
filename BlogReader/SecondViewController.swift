//
//  SecondViewController.swift
//  BlogReader
//
//  Created by IMCS2 on 2/21/19.
//  Copyright © 2019 com.phani. All rights reserved.
//
import WebKit
import UIKit

class SecondViewController: UIViewController,UIWebViewDelegate {

    @IBOutlet weak var webview: WKWebView!
     var string_url : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if( string_url != "") {
        let url = URL(string: string_url)
        let urlRequest = URLRequest(url:url!)
        webview.load(urlRequest)
        print(urlRequest)
        // Do any additional setup after loading the view.
        }
    }
    

    
}
