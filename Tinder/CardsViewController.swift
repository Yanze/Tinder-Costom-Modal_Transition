//
//  ViewController.swift
//  Tinder
//
//  Created by Rui Mao on 4/26/17.
//  Copyright © 2017 Rui Mao. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController, DraggableImageViewDelegate {
    var imageView: DraggableImageView!
    var profileImageOriginalCenter: CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = DraggableImageView(frame: CGRect(x:36 , y:150, width:view.bounds.width, height: 304))
        imageView.delegate = self
        imageView.profileImage = UIImage(named: "ryan")
        view.addSubview(imageView)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func imgViewTapped() {
        let profileVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        self.present(profileVC, animated: true, completion: nil)
    }

}

