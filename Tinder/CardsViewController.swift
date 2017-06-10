//
//  ViewController.swift
//  Tinder
//
//  Created by Rui Mao on 4/26/17.
//  Copyright © 2017 Rui Mao. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    var imageView: DraggableImageView!
    var profileImageOriginalCenter: CGPoint!
    var isPresenting: Bool = true


    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = DraggableImageView(frame: CGRect(x:36 , y:150, width:view.bounds.width, height: 304))
        let xx = UITapGestureRecognizer(target: self, action: #selector(imgViewOnTap))
        imageView.addGestureRecognizer(xx)
        imageView.profileImage = UIImage(named: "ryan")
        view.addSubview(imageView)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    func imgViewOnTap(sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "profileSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "profileSegue" {
            let destionationVC = segue.destination as! ProfileViewController
            destionationVC.modalPresentationStyle = UIModalPresentationStyle.custom
            destionationVC.transitioningDelegate = self
        }
    }
    
    
    //MARK: transition methods
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = true
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = false
        return self
    }
    
    // MARK: methods that actually control the transition
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        // this value is the duration of the animations scheduled in the animationTransition method
        return 0.4
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
        let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
        
        if isPresenting {
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            UIView.animate(withDuration: 0.4, animations: { 
                toViewController.view.alpha = 1
            }, completion: { (finished:Bool) in
                transitionContext.completeTransition(true)
            })
        }
        else {
            UIView.animate(withDuration: 0.4, animations: { 
                fromViewController.view.alpha = 0
            }, completion: { (finished:Bool) in
                transitionContext.completeTransition(true)
                fromViewController.view.removeFromSuperview()
            })
        }
        
    }

}


