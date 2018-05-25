//
//  pictureViewController.swift
//  SlideshowApp
//
//  Created by 内山由基 on 2018/05/24.
//  Copyright © 2018年 yuuki uchiyama. All rights reserved.
//

import UIKit

class pictureViewController: UIViewController {

    @IBOutlet var expandedImageView: UIImageView! //拡大画像
    @IBOutlet var expandedTitleLabel: UILabel! //世界遺産名
    @IBOutlet var commentsLabel: UILabel! //説明文
    
    let expandedImageViewArray = ["worldHeritage1.jpg", "worldHeritage2.jpg", "worldHeritage3.jpg"]
     //拡大画像の配列
    
    let expandedTitleLabelArray = ["マチュピチュ", "モン・サン・ミシェル", "屋久島"]
     //世界遺産名の配列
    let commentsLabelArray = ["ペルー南部高地のウルバンバ峡谷にあるインカ帝国の要塞都市遺跡。\n1983年世界遺産登録", "フランス，モンサンミシェル湾に浮かぶ小島および修道院。\n1979年世界遺産登録", "鹿児島県南部佐多岬南方約60kmの海上に浮かぶ島\n1993年世界遺産登録"]
     //説明文の配列
    
    var expandedViewNo = 0
     //画像や名前・説明文を変える為の番号
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        expandedImageView.image = UIImage(named: expandedImageViewArray[expandedViewNo])
         //画像表示
        
        expandedTitleLabel.text = expandedTitleLabelArray[expandedViewNo]
         //名前表示
        
        commentsLabel.numberOfLines = 3
        commentsLabel.text = commentsLabelArray[expandedViewNo]
         //説明文表示
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
