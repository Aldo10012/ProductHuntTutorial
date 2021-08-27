//
//  CommentsViewController.swift
//  ProductHunt
//
//  Created by Alberto Dominguez on 8/27/21.
//

import UIKit

class CommentsViewController: UIViewController {
    
    @IBOutlet weak var commentsTableView: UITableView!
    
    var comments: [Comment] = [] {
        didSet {
            commentsTableView.reloadData()
        }
    }
    
    var postID: Int!
    var networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commentsTableView.delegate = self
        commentsTableView.dataSource = self
        updateComments()
    }
    
    func updateComments() {
        // Similar to what we did for posts
        networkManager.getComments(postID) { result in
            switch result {
            case let .success(comments):
                self.comments = comments
            case let .failure(error):
                print(error)
            }
        }
    }
    
    
}

extension CommentsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as! CommentTableViewCell
        
        let comment = comments[indexPath.row]
        cell.commentTextView.text = comment.body
        
        return cell
    }
}

// MARK: UITableViewDelegate
extension CommentsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
}


