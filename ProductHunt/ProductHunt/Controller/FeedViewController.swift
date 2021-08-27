//
//  ViewController.swift
//  ProductHunt
//
//  Created by Alberto Dominguez on 8/23/21.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var feedTableView: UITableView!
    
    
    var posts: [Post] = [] {
       didSet {
           feedTableView.reloadData()
       }
    }
    
    var networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        feedTableView.dataSource = self
        feedTableView.delegate = self
        updateFeed()
        
        print("posts: \n\(posts)\n")
    }
    
    func updateFeed() {
        // call our network manager's getPosts method to update our feed with posts
        networkManager.getPosts() { result in
            switch result {
            case let .success(posts):
                self.posts = posts
            case let .failure(error):
                print(error)
            }
        }
    }


}

// MARK: UITableViewDataSource
extension FeedViewController: UITableViewDataSource {
   /// Determines how many cells will be shown on the table view.
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
   }

   /// Creates and configures each cell.
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // dequeue and return an available cell, instead of creating a new cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
    
        // Grab a post from our "data"
        let post = posts[indexPath.row]
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = posts[indexPath.row]
        // Get the storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        // Get the commentsView from the storyboard
        guard let commentsView = storyboard.instantiateViewController(withIdentifier: "commentsView") as? CommentsViewController else {
            return
        }
        // set the post id for the comments
        commentsView.postID = post.id
        navigationController?.pushViewController(commentsView, animated: true)
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
