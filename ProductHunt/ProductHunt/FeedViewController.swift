//
//  ViewController.swift
//  ProductHunt
//
//  Created by Alberto Dominguez on 8/23/21.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var feedTableView: UITableView!
    
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
       return 3
   }

   /// Creates and configures each cell.
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       return UITableViewCell()
  }
}

// MARK: UITableViewDelegate
extension FeedViewController: UITableViewDelegate {
  // Code to handle cell events goes here...
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
