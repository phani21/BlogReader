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
        webview.reloadInputViews()
        webview.load(urlRequest)
        print(urlRequest)
        // Do any additional setup after loading the view.
        }}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
