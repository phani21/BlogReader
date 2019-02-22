//
//  ViewController.swift
//  BlogReader
//
//  Created by IMCS2 on 2/21/19.
//  Copyright © 2019 com.phani. All rights reserved.
//

import UIKit

var i = 0
var titleArray = [String]()
let url = URL(string:"https://www.googleapis.com/blogger/v3/blogs/2399953?maxPosts=30&key=AIzaSyD_oygweFhsV0GZPZ276kbpMh4TMCPC1K8")
let title = ""
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("Title Array Count:\(titleArray.count)")
    return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        
        
        
        cell.textLabel?.text = titleArray[indexPath.row]
        return cell
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("VIew DIDLOAD")
       
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                if let unWrappedData = data {
                    do{
                        let jsonResult = try JSONSerialization.jsonObject(with: unWrappedData, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                        // print(jsonResult)
                        print("here")
                        
                        let posts = jsonResult!["posts"] as? NSDictionary
                        // print(posts)
                        let blog = posts!["items"] as? NSArray
                        
                        while  i < 30{
                        // print("blog: \(blog)")
                        let items = blog?[i] as? NSDictionary
                        // print(blogTitle)
                        let title = items?["title"] as? String
                        print(title)
                        
                        if let res = title {
                            print(title)
                            // print(res)
                            DispatchQueue.main.async {
                                if( res != nil){
                                    titleArray.append(title!)
                                    print("titleArray : \(titleArray)")
                                    self.tableView.reloadData()
                                }
                                else{
                                    print("Title Array error")
                                }
                            }
                        }
                    i+=1
                        }
                    
                    
                    }
                    catch{
                        print("Error fetching API DATA")
                    }
            }
            
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    task.resume()
}


}
