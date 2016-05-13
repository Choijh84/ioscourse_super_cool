//
//  ViewController.swift
//  ImageDownload
//
//  Created by ChoiJinYoung on 1/6/16.
//  Copyright © 2016 appstamp. All rights reserved.
//

import UIKit

class ViewController: UIViewController,NSURLSessionDownloadDelegate {

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var indicator: UIActivityIndicatorView!
    @IBOutlet var progressView: UIProgressView!
    var downloadTask:NSURLSessionDownloadTask!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func downloadAction(sender: AnyObject) {
        self.imgView.image = nil
        self.progressView.setProgress(0.0, animated: true)
        self.indicator.startAnimating()
        let sessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: sessionConfiguration, delegate: self, delegateQueue: NSOperationQueue.mainQueue())
        downloadTask = session.downloadTaskWithURL(NSURL(string: "https://raw.githubusercontent.com/ChoiJinYoung/iphonewithswift2/master/sample.jpeg")!)
        downloadTask.resume()
        
    }
    
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let progress:Float = Float(totalBytesWritten)/Float(totalBytesExpectedToWrite)
        self.progressView.setProgress(progress, animated: true)
    }
    
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didFinishDownloadingToURL location: NSURL) {
        let data:NSData = NSData(contentsOfURL: location)!
        self.imgView.image = UIImage(data: data)
        self.indicator.stopAnimating()
    }
    
    @IBAction func suspendAction(sender: AnyObject) {
        downloadTask.suspend()
    }
    @IBAction func resumeAction(sender: AnyObject) {
        downloadTask.resume()
    }
    @IBAction func cancelAction(sender: AnyObject) {
        downloadTask.cancel()
        self.progressView.setProgress(0.0, animated: true)
        self.indicator.stopAnimating()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

