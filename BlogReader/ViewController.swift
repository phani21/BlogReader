//
//  ViewController.swift
//  BlogReader
//
//  Created by IMCS2 on 2/21/19.
//  Copyright © 2019 com.phani. All rights reserved.
//
import WebKit
import UIKit

var count = 0
var titleArray = [String]()
var urlArray = [String]()
let url = URL(string:"https://www.googleapis.com/blogger/v3/blogs/2399953?maxPosts=30&key=AIzaSyD_oygweFhsV0GZPZ276kbpMh4TMCPC1K8")
let title = ""
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var urlOfBlog : String?

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "custom", for: indexPath) as UITableViewCell
        cell.textLabel?.text = titleArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        urlOfBlog = urlArray[indexPath.row]
        print(indexPath.row)
        performSegue(withIdentifier: "segg", sender: self)
        
    }
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! SecondViewController
        vc.string_url = urlOfBlog
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                if let unWrappedData = data {
                    do{
                        let jsonResult = try JSONSerialization.jsonObject(with: unWrappedData, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                        
                        let posts = jsonResult!["posts"] as? NSDictionary
                        let blog = posts!["items"] as? NSArray
                        while  count < 30 {
                            let items = blog?[count] as? NSDictionary
                            let urlstring = items?["url"] as? String
                            let title = items?["title"] as? String
                            
                            if title != nil {
                                DispatchQueue.main.async {
                                    titleArray.append(title!)
                                    urlArray.append(urlstring!)
                                    self.tableView.reloadData()
                                }
                            }
                            count+=1
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
