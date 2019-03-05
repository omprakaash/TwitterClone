//
//  HomeTableViewController.swift
//  Twitter
//
//  Created by Om Prakaash on 3/4/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {

   
    var tweetArary = [NSDictionary]()
    var numTweets: Int!
    
    
    func loadTweet(){
    
        let url = "https://api.twitter.com/1.1/statuses/home_timeline.json"
        let params = ["count":10]
        
        TwitterAPICaller.client?.getDictionariesRequest(url: url, parameters: params, success: {
            (tweets: [NSDictionary]) in
            
            self.tweetArary.removeAll()
            
            for tweet in tweets{
                self.tweetArary.append(tweet)
            }
            self.tableView.reloadData()
            
        }, failure: {
            (Error) in
            print("Could not load tweets")
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTweet()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath) as! TweetCell
        
        
        let user = self.tweetArary[indexPath.row]["user"] as! NSDictionary
        
        cell.userNameLabel.text = user["name"] as? String
        cell.tweetContent.text = self.tweetArary[indexPath.row]["text"] as? String
        
        
        let imageUrl = URL(string: (user["profile_image_url_https"] as? String)!)
        let data = try? Data(contentsOf: imageUrl!)
        if let imageData = data{
            cell.profileImage.image = UIImage(data: imageData)
        }
        
        return cell
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweetArary.count
    }
    
    @IBAction func OnLogout(_ sender: Any) {
        TwitterAPICaller.client?.logout()
        self.dismiss(animated: true, completion: nil)
        UserDefaults.standard.set(false, forKey: "userLoggedIn")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
