//
//  DetailViewController.swift
//  TableViewPractice
//
//  Created by Phammel on 1/19/16.
//  Copyright © 2016 Phammel. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var myimageView: UIImageView!
    @IBOutlet weak var nametext: UITextField!
    @IBOutlet weak var ailiastext: UITextField!
    @IBOutlet weak var powertext: UITextField!
    
    var superHero : SuperHeroClass!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        nametext.text = superHero.name
        ailiastext.text = superHero.ailias
        powertext.text = String(superHero.power)
        myimageView.image = superHero.image
        
    }

    
    @IBAction func savebuttonTapped(sender: UIButton)
    {
        superHero.name = nametext.text!
        superHero.ailias = ailiastext.text!
        superHero.power = (powertext.text! as NSString).integerValue
    }

  

}
