//
//  FFListVC.swift
//  FigFeed
//
//  Created by CHEN Bin on 01/09/15.
//  Copyright (c) 2015 funtek. All rights reserved.
//

import UIKit

let kFFListVCDefaultCellBgColor = UIColor.whiteColor()
let kFFListVCDarkerCellBgColor = UIColor(white: 0.95, alpha: 1.0)

class FFListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var refreshControl:UIRefreshControl!
    var articles = []
    lazy var dataManager:FFDataManager = FFDataManager()
    var requestManager:FFRequestManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "LeFigaro"
        addRefreshControl()
        
        requestManager = FFRequestManager(dataManager: dataManager)
        loadCachedData()
        loadNewData(nil)

        tableView.registerNib(UINib(nibName: "FFArticleCell", bundle: nil), forCellReuseIdentifier: "articleCell")
    }

    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    func loadCachedData(){
        articles = dataManager.fetch()!
    }

    func loadNewData(sender:AnyObject?){
        requestManager?.requestAllWithCompletionBlock { (feeds, error) -> Void in
            self.articles = feeds
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
    
    func addRefreshControl(){
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: "loadNewData:", forControlEvents: UIControlEvents.ValueChanged)
        tableView.addSubview(refreshControl)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles.count;
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:FFArticleCell = tableView.dequeueReusableCellWithIdentifier("articleCell") as! FFArticleCell
        
        let article = articles[indexPath.row] as! FFArticle
 
        let articleViewModel = FFArticleViewModel(article:article)
        cell.viewModel = articleViewModel

        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)

        var article = articles[indexPath.row] as? FFArticle
        dataManager.setHasReadForId(article!)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("FFArticleVC") as! FFArticleVC
        vc.article = article
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath){
        cell.contentView.backgroundColor = (indexPath.row % 2) == 0 ? kFFListVCDefaultCellBgColor : kFFListVCDarkerCellBgColor
    }

}

