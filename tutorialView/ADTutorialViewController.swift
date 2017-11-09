//
//  ADTutorialViewController.swift
//  tutorialView
//
//  Created by 董安东 on 09/11/2017.
//  Copyright © 2017 Adam. All rights reserved.
//

import UIKit
import UserNotifications

class ADTutorialViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var pageControll: UIPageControl!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pageControlAction(_ sender: UIPageControl) {
        moveToPageOfNum(sender.currentPage)
    }
    
    func moveToPageOfNum(_ num: Int) {
        let contentOffset = CGPoint.init(x: CGFloat(num) *  scrollView.frame.size.width, y: 0)
        scrollView.setContentOffset(contentOffset, animated: true)
    }
    
    @IBAction func closeButtonAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func enableNotificationAction(_ sender: UIButton) {
        UNUserNotificationCenter.current().requestAuthorization(options: [UNAuthorizationOptions.alert,UNAuthorizationOptions.badge,UNAuthorizationOptions.sound]) { (success, error) in
            if success == false {
                DispatchQueue.main.sync {
                     UIApplication.shared.openURL(NSURL(string: UIApplicationOpenSettingsURLString)! as URL )
                }
            } else {
                self.closeButtonAction(UIButton.init())
            }
        }
    }
    
    
    //MARK: UIScrollViewDelegate
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
         let page  = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        print("page = \(page)")
        pageControll.currentPage = page
    }

}
