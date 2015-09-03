//
//  FFListVC.swift
//  FigFeed
//
//  Created by CHEN Bin on 01/09/15.
//  Copyright (c) 2015 funtek. All rights reserved.
//

import UIKit

class FFListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var refreshControl:UIRefreshControl!

    var items = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "LeFigaro"
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        tableView.addSubview(refreshControl)

        refresh(nil)

        tableView.registerNib(UINib(nibName: "FFArticleCell", bundle: nil), forCellReuseIdentifier: "articleCell")
//        tableView.registerClass(FFArticleCell.self, forCellReuseIdentifier: "articleCell")
    }

    func refresh(sender:AnyObject?){
        FFRequestManager.requestAllWithCompletionBlock { (feeds, error) -> Void in
            self.items = feeds
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:FFArticleCell = self.tableView.dequeueReusableCellWithIdentifier("articleCell") as! FFArticleCell
        
        let article = self.items[indexPath.row] as? FFArticle
        cell.titleLabel?.text = article?.title
        cell.setImageUrl(article!.thumbnailUrl()!)
        println(article?.title)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        self.performSegueWithIdentifier("push", sender: indexPath.row)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("FFArticleVC") as! FFArticleVC
        vc.article = items[indexPath.row] as! FFArticle
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//        if (segue.destinationViewController.isKindOfClass(FFArticleVC))
//        {
//            let vc = segue.destinationViewController as! FFArticleVC
////            vc.article = items[sender] as FFArticle
//        }
//    }

}

