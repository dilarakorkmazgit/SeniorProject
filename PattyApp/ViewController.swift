//
//  ViewController.swift
//  PattyApp
//
//  Created by Dilara Korkmaz on 16/10/2017.
//  Copyright © 2017 Dilara Korkmaz. All rights reserved.
//
import UIKit
import AVFoundation
import MapKit


class ViewController: UIViewController,UIScrollViewDelegate {
    
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
  

    var colorRange :[UIColor] = [UIColor.white,UIColor.white,UIColor.white,UIColor.white]
    
    var frame = CGRect(x:0,y:0,width:0,height:0)
    
    
    var Player: AVPlayer!
    var PlayerLayer: AVPlayerLayer!
    
  //  var frameVideo = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //fit the background image -MÜKEMMEL KOD CUK OTURUYİİİİİİİİ
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "BACKGROUND-1")
        backgroundImage.contentMode =  UIViewContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        
        //Adding different scrolview Page
        
        //pageControl.numberOfPages = colorRange.count
       // pageControl.numberOfPages = logoImage.count
        
       // for index in 0..<logoImage.count {
            
        //    frame.origin.x = ScrollView.frame.size.width * CGFloat(index)
          //  frame.size = ScrollView.frame.size
            
            frame.origin.x = self.ScrollView.frame.size.width * CGFloat(index)
            frame.size = self.ScrollView.frame.size
            self.ScrollView.isPagingEnabled = true
            let subview = UIImageView(frame: frame)
            subview.image = logoImage[index]
            self.ScrollView.addSubview(subview)
        }

        
        ScrollView.contentSize = CGSize(width:(ScrollView.frame.size.width * CGFloat(logoImage.count)),height :ScrollView.frame.size.height)
        ScrollView.delegate = self
        
        //ŞİMDİLİK VİDEOYU COMMENTE ALDIM SONRA BAKARIz
        
        //let URL:NSURL = NSURL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")!
        
       // Player = AVPlayer.init(url: URL as URL)
        //PlayerLayer = AVPlayerLayer(player: Player)
        //PlayerLayer.videoGravity = AVLayerVideoGravityResize
        //PlayerLayer.frame.size = frameVideo.size
        //Player.actionAtItemEnd = AVPlayerActionAtItemEnd.none
        //Player.isMuted = true
        //Player.play()
        
        //view.layer.insertSublayer(PlayerLayer, at: 0)
        //NotificationCenter.default.addObserver(self, selector: #selector(playerItemReachEnd(notification:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: Player.currentItem)
        
        
        
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
        
        let pageNumber = ScrollView.contentOffset.x / ScrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
        pageControl.currentPageIndicatorTintColor = colorRange[pageControl.currentPage]
        
    }
    
    func playerItemReachEnd(notification: NSNotification) {
        
        Player.seek(to: kCMTimeZero)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pageChanger(_ sender: UIPageControl) {
        
        let x = CGFloat(sender.currentPage) * ScrollView.frame.size.width
        ScrollView.contentOffset = CGPoint(x:x,y:0)
    }
    
}

