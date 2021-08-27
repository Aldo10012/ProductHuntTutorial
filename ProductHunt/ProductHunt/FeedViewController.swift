//
//  ViewController.swift
//  ProductHunt
//
//  Created by Alberto Dominguez on 8/23/21.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var feedTableView: UITableView!
    
    var mockData: [Post] = {
       var meTube = Post(id: 0, name: "MeTube", tagline: "Stream videos for free!", votesCount: 25, commentsCount: 4)
       var boogle = Post(id: 1, name: "Boogle", tagline: "Search anything!", votesCount: 1000, commentsCount: 50)
       var meTunes = Post(id: 2, name: "meTunes", tagline: "Listen to any song!", votesCount: 25000, commentsCount: 590)
        
       return [meTube, boogle, meTunes]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        feedTableView.dataSource = self
        feedTableView.delegate = self
    }


}

// MARK: UITableViewDataSource
extension FeedViewController: UITableViewDataSource {
   /// Determines how many cells will be shown on the table view.
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockData.count
   }

   /// Creates and configures each cell.
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // dequeue and return an available cell, instead of creating a new cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
    
        // Grab a post from our "data"
        let post = mockData[indexPath.row]
        // Assign a post to that cell
        cell.post = post
    
        return cell
  }
}

// MARK: UITableViewDelegate
extension FeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      // provide a fixed size
      return 250
    }
}




/*
 Redirect URI:  https://localhost:3000/users/auth/producthunt/callback
 API Key:       EC9VyPNfKOS2ZKEaXsBegCAtOItuPd2LWOJs7B-F1Ks
 API Secret:    xyaCT8wt-_V4lPQ9DGi2WVKeBLIBeWprbqB5mMsBIjw

 Token:         E_BU53tmRmBEd3NnaTAksFR8Ipt0aITaruwiDxsQs5c
 User Context:  Alberto Dominguez
 Expires:       Never
 
 IMPORTANT LINKS:
 https://www.producthunt.com/v2/oauth/applications
 https://api.producthunt.com/v1/docs/posts/posts_index_get_the_tech_posts_of_today
 
 */
