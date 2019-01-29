//
//  ViewController.swift
//  HelloRest
//
//  Created by mobapp06 on 29/01/2019.
//  Copyright © 2019 EhB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var items = [UserPost].init()
    @IBOutlet weak var tableview: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = PostParser.getAllPosts()
      
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! DetailViewController
        
        let touchedcell = sender as! UITableViewCell
        let indexpath = tableview.indexPath(for: touchedcell)!
        
        let gekozenPost = items[indexpath.row]
        destination.post = gekozenPost
        
    }
    
}

extension ViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        let userPostForCell = items[indexPath.row]
        
        cell.textLabel!.text = userPostForCell.title
        
        return cell
    }
    
}
