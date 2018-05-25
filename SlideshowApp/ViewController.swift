//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 内山由基 on 2018/05/24.
//  Copyright © 2018年 yuuki uchiyama. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIGestureRecognizerDelegate{
  
    @IBOutlet var WHImageView: UIImageView! //世界遺産画像
    @IBOutlet var WHLabel: UILabel! //世界遺産名
    @IBOutlet var slideShowLabel: UIButton! //再生・停止のラベル
    @IBOutlet var toPrevButton: UIButton! //「前の画像」のボタン
    @IBOutlet var toNextButton: UIButton! //「次の画像」のボタン
    
    
  
    
    let WHImageViewArray = ["worldHeritage1.jpg", "worldHeritage2.jpg", "worldHeritage3.jpg"]
     //世界遺産画像の配列
    
    let WHLabelArray = ["マチュピチュ", "モン・サン・ミシェル", "屋久島"]
     //世界遺産名の配列
    
    var viewNo = 0 //画像や名前を変える為の番号

    func displayImage(){
        let imageName = WHImageViewArray[viewNo]
        let image = UIImage(named: imageName)
        WHImageView.image = image
         //画像表示の機能
    }
    
    func displayLabel(){
        let labelName = WHLabelArray[viewNo]
        WHLabel.text = labelName
         //名前表示の機能
    }
    
    @IBAction func toPrev(_ sender: Any) {
        if viewNo == 0 {
            viewNo = 2
            displayImage()
            displayLabel()
        }
        else {
            viewNo -= 1
            displayImage()
            displayLabel()
        }
         //「前の画像」ボタンを押した時の機能
    }
    
    @IBAction func toNext(_ sender: Any) {
        if viewNo == 2 {
            viewNo = 0
            displayImage()
            displayLabel()
        }
        else{
            viewNo += 1
            displayImage()
            displayLabel()
        }
         //「次の画像」ボタンを押した時の機能
    }
    
    var timer: Timer!
    var timer_sec = 0
    var timerCount = 0
     //スライドショーの為のtimerの変数など
    
    @IBAction func slideShow(_ sender: Any) {
        if timerCount == 1 {
           self.timer.invalidate()
            slideShowLabel.setTitle("再生", for: .normal)
            timerCount = 0
            toPrevButton.isEnabled = true
            toNextButton.isEnabled = true
        }
        else{
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(toNext(_:)), userInfo: nil, repeats: true)
            slideShowLabel.setTitle("停止", for: .normal)
            timerCount = 1
            toPrevButton.isEnabled = false
            toNextButton.isEnabled = false
        }
         //再生・停止ボタンを押した時の機能
         //タイマー起動およびボタンの表示名の変更
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        displayImage()
        displayLabel()
        slideShowLabel.setTitle("再生", for: .normal)
        
        
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(ViewController.tapIvent))
        self.WHImageView.addGestureRecognizer(tapGesture)
         //UIImageViewにタップ機能を持たせる為のコード
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let PictureViewController:pictureViewController = segue.destination as! pictureViewController
        PictureViewController.expandedViewNo = viewNo
         //画面遷移した時に画像番号を次のViewControllerに渡す為のコード
    }
    
    @objc func tapIvent(sender:UITapGestureRecognizer){
        if sender.state == .ended{
            self.performSegue(withIdentifier: "toPictureViewController", sender: nil)
            if timerCount == 1{
                self.timer.invalidate()
                slideShowLabel.setTitle("再生", for: .normal)
                timerCount = 0
                toPrevButton.isEnabled = true
                toNextButton.isEnabled = true
            }
        }
         //UIImageViewをタップした時の機能
         //画面遷移＋スライドショーを止める
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue){
         //次の画面からこの画面へ戻る為のコード
        }    
}

