//
//  ViewController.swift
//  Alert Coin
//
//  Created by Luiz Ilha on 7/29/15.
//  Copyright (c) 2015 Ilha. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getCoin(index: Int, key: String) -> String {
        let url = "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.xchange%20where%20pair%20in%20(%22USDBRL%22%2C%22GBPUSD%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback="
        let jsonData = NSData(contentsOfURL: NSURL(string: url)!)
        let result = NSJSONSerialization.JSONObjectWithData(jsonData!, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
        return (result.objectForKey("query")!.objectForKey("results")!.objectForKey("rate")?.objectAtIndex(index).objectForKey(key)?.description)!

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("mainCell") as! MainCell
        cell.coinName.text = "BRL/USD Dolar Americano"
        cell.coinValue.text = getCoin(0, key: "Bid")
        return cell
    }
}

