//
//  ViewController.swift
//  Tinder
//
//  Created by Rui Mao on 4/26/17.
//  Copyright © 2017 Rui Mao. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    var imageView: DraggableImageView!
    var profileImageOriginalCenter: CGPoint!
    var fadeTransition: FadeTransition!

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = DraggableImageView(frame: CGRect(x:36 , y:150, width:view.bounds.width, height: 304))

        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imgViewOnPinch)))
        imageView.profileImage = UIImage(named: "ryan")
        view.addSubview(imageView)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    func imgViewOnPinch(sender: UITapGestureRecognizer) {
        let image = sender.view as! DraggableImageView
        performSegue(withIdentifier: "profileSegue", sender: image)
 
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "profileSegue" {
            let destionationVC = segue.destination as! ProfileViewController
            let draggableImgView = sender as! DraggableImageView
            destionationVC.modalPresentationStyle = UIModalPresentationStyle.custom
            destionationVC.profileImg = draggableImgView.profileImage
   
            // create a FadeTransition instance
            fadeTransition = FadeTransition()
            destionationVC.transitioningDelegate = fadeTransition
            
            // adjust the transition duration
            fadeTransition.duration = 0.7
            
        }
    }

}


