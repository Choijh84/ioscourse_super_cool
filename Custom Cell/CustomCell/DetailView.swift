//
//  DetailView.swift
//  CustomCell
//
//  Created by Owner on 2016. 5. 10..
//  Copyright © 2016년 appstamp. All rights reserved.
//

import UIKit

class DetailView: UIViewController {

    var detailData = [String: String]()
    
    @IBOutlet var detailImgView: UIImageView!
    
    @IBOutlet var detailNameLabel: UILabel!
    @IBOutlet var detailAmountLabel: UILabel!
    @IBOutlet var detailPriceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailImgView.layer.cornerRadius = 50.0
        detailImgView.layer.masksToBounds = true
        
        detailNameLabel.text = detailData["name"]
        detailAmountLabel.text = detailData["amount"]
        detailPriceLabel.text = detailData["value"]

        detailImgView.image = UIImage(named: detailData["image"]!)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
