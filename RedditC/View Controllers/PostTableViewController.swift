//
//  PostTableViewController.swift
//  RedditC
//
//  Created by Cody on 3/27/19.
//  Copyright © 2019 Cody Adcock. All rights reserved.
//

import UIKit

class PostTableViewController: UITableViewController {

    @IBOutlet weak var redditSearchBar: UISearchBar!
    
    var posts: [CRAPost]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        redditSearchBar.delegate = self
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? PostTableViewCell
        guard let posts = posts else {return UITableViewCell()}
        
        let post = posts[indexPath.row]
        cell?.post = post
        
        return cell ?? UITableViewCell()
    }
}

extension PostTableViewController{
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

extension PostTableViewController: UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else {return}
        let formattedSearch = searchTerm.lowercased().replacingOccurrences(of: " ", with: "")
        CRASubredditClient.fetchAllSubReddits(forTitle: formattedSearch) { (posts) in
            self.posts = posts
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
}
