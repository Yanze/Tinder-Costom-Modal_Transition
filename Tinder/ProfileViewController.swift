//
//  ProfileViewController.swift
//  Tinder
//
//  Created by Rui Mao on 4/26/17.
//  Copyright © 2017 Rui Mao. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var doneImgView: UIImageView!
    @IBOutlet weak var profileImgView: UIImageView!
    var profileImg: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        doneImgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissViewController)))
        doneImgView.isUserInteractionEnabled = true
        
        profileImgView.image = profileImg

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissViewController(sender: UITapGestureRecognizer) {
        dismiss(animated: true)
    }


}
