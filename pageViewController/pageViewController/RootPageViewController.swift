//
//  RootPageViewController.swift
//  pageViewController
//
//  Created by Pushparaj Selvam on 04/12/20.
//

import UIKit

class RootPageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    lazy var viewControllerList:[UIViewController] = {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc1 = sb.instantiateViewController(identifier: "blueVC")
        let vc2 = sb.instantiateViewController(identifier: "redVC")
        let vc3 = sb.instantiateViewController(identifier: "skyVC")
        
        return [vc1, vc2, vc3]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        if let fvc = viewControllerList.first{
            self.setViewControllers([fvc], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = viewControllerList.index(of: viewController) else{return nil}
        let prevVC = vcIndex - 1
        guard prevVC >= 0 else{return nil}
        return viewControllerList[prevVC]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = viewControllerList.index(of: viewController) else{return nil}
        let nextVC = vcIndex + 1
        guard nextVC < viewControllerList.count else{return nil}
        return viewControllerList[nextVC]
    }
}
