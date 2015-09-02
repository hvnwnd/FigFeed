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
    var items = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "LeFigaro"
        FFRequestManager.requestAllWithCompletionBlock { (feeds, error) -> Void in
            self.items = feeds
            self.tableView.reloadData()
            println(self.items)
        }

        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        
        let article = self.items[indexPath.row] as? FFArticle
        cell.textLabel?.text = article?.title
        cell.textLabel?.textColor = UIColor.blackColor()
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

