//
//  filmAndLit.swift
//  FliqueEditorial
//
//  Created by Sahen Rai on 9/14/20.
//  Copyright © 2020 Sahen Rai. All rights reserved.
//

import UIKit
import FeedKit

class mainFeed: UIViewController, UITableViewDelegate, UITableViewDataSource,UITabBarDelegate {
    @IBOutlet weak var table: UITableView!
    
    var curFeed = ""
    
    let film = "https://www.fliqueeditorial.com/film-literature-reviews?format=rss"
    
    let life = "https://www.fliqueeditorial.com/lifestyle?format=rss"
    
       let opinion = "https://www.fliqueeditorial.com/opinionpieces?format=rss"
    
    let kait =  "https://www.fliqueeditorial.com/kait-on-a-date?format=rss"
    
     let fashionbeauty =  "https://www.fliqueeditorial.com/fashionbeauty?format=rss"

    
      var articles: [RSSFeedItem] = []
    

    var urls = [String:String]()
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserDefaults.standard.set(articles[indexPath.row].link!, forKey: "curUrl")
        performSegue(withIdentifier: "urlView", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        urls = ["Fashion":fashionbeauty,"Film":film,"Lifestyle":life,"Kait":kait,"Opinion":opinion]
       
        let title = UILabel()
        
        title.text = "Test"
        
        self.table.tableHeaderView = title
        
              curFeed = film
                     
                     let timer1 = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: false)

                     
                     let feedURL = URL(string: curFeed)!
                     
                     let parser = FeedParser(URL: feedURL)
                     
                     var cell = UITableViewCell()
                   
                     let result = parser.parse()
                     
                     
                     
                     switch result {
                     case .success(let feed):
                   
                     
                       let rss = feed.rssFeed
                         
                       articles = rss!.items!
                         
           
                      
                         
                     case .failure(let error):
                         print(error)
                     }
            }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articles.count
    }
    
    

    @objc func fireTimer() {
        self.table.reloadData()
       

    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
             let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel!.text = articles[indexPath.row].title
        let formatter1 = DateFormatter()
        cell.detailTextLabel!.text = "Test"
            
           // formatter1.string(from: articles[indexPath.row].pubDate!)

    
        return cell
     
    }
    
    func updateData(urlString: String){
        
                      let feedURL = URL(string: urlString)
                      
        let parser = FeedParser(URL: feedURL!)
                      
                      var cell = UITableViewCell()
                    
                      let result = parser.parse()
                      
                      
                      
                      switch result {
                      case .success(let feed):
                    
                      
                        let rss = feed.rssFeed
                          
                        articles = rss!.items!
                          
            
                       
                          
                      case .failure(let error):
                          print(error)
                      }
      
        self.table.reloadData()
                   
    }
    
        func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
            
            updateData(urlString: urls[item.title ?? ""] ?? "")

         
               
       

        }
  
    

}
