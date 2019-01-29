//
//  DetailViewController.swift
//  HelloRest
//
//  Created by mobapp06 on 29/01/2019.
//  Copyright © 2019 EhB. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var tvbody: UITextView!
    var post:UserPost?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

       lblTitle.text = post!.title
        tvbody.text = post!.body
        
        let username = PostParser.userById(userId: post!.userId)
        lblUsername.text = username
        
        //title in navbar aanpassen
        self.title = post!.title
    }
    


}
