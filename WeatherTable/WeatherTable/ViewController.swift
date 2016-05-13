//
//  ViewController.swift
//  WeatherTable
//
//
//
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var datalist:[[String:String]]=[[:]]
    // 배열안에 딕셔너리를 넣은 것을 이렇게 표현함, 전형적으로 많이 쓰는 구조 
    // 딕셔너리를 다시 한 번 공부해봅세
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datalist.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // NSIndexPath는 검색을 하면 다른 문서가 나온다.... 너무 툴을 맹신하지 말자
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        // 이 셀의 이름을 맞춰줘야 함.
        
        var dicTemp = datalist[indexPath.row]
        
        cell.textLabel!.text = dicTemp["지역"]
        
        let weatherStr = dicTemp["날씨"]
        
        cell.detailTextLabel!.text = weatherStr
        
        if weatherStr == "맑음" {
            cell.imageView!.image = UIImage(named: "sunny.png")
        } else if weatherStr == "비" {
            cell.imageView!.image = UIImage(named: "rainy.png")
        } else if weatherStr == "흐림" {
            cell.imageView!.image = UIImage(named: "cloudy.png")
        } else if weatherStr == "눈" {
            cell.imageView!.image = UIImage(named: "snow.png")
        } else {
            cell.imageView!.image = UIImage(named: "blizzard.png")
        }
                
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100.0
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let dict1 = ["지역":"한국","날씨":"비"]
        let dict2 = ["지역":"일본","날씨":"맑음"]
        let dict3 = ["지역":"중국","날씨":"눈"]
        let dict4 = ["지역":"스페인","날씨":"우박"]
        let dict5 = ["지역":"미국","날씨":"흐림"]
        let dict6 = ["지역":"영국","날씨":"비"]
        let dict7 = ["지역":"프랑스","날씨":"흐림"]
        let dict8 = ["지역":"브라질","날씨":"우박"]
        let dict9 = ["지역":"스위스","날씨":"맑음"]
        let dict10 = ["지역":"덴마크","날씨":"비"]
        let dict11 = ["지역":"스웨덴","날씨":"눈"]
        let dict12 = ["지역":"네덜란드","날씨":"비"]
        let dict13 = ["지역":"크로아티아","날씨":"맑음"]
        let dict14 = ["지역":"필리핀","날씨":"맑음"]
        let dict15 = ["지역":"독일","날씨":"눈"]
        let dict16 = ["지역":"헝가리","날씨":"비"]
        let dict17 = ["지역":"벨기에","날씨":"흐림"]
        let dict18 = ["지역":"핀란드","날씨":"우박"]
        let dict19 = ["지역":"이탈리아","날씨":"맑음"]
        
        datalist = [dict1,dict2,dict3,dict4,dict5,dict6,dict7,dict8,dict9,dict10,dict11,dict12,dict13,dict14,dict15,dict16,dict17,dict18,dict19]
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

