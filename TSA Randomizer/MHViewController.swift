//
//  ViewController.swift
//  TSA Randomizer
//
//  Created by Michael Hulet on 4/15/16.
//  Copyright © 2016 Michael Hulet. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    @IBOutlet weak var arrowView: UIImageView!
    @IBOutlet weak var directionLabel: UILabel!
    override func viewDidLoad() -> Void{
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        randomize()
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) -> Void{
        randomize()
    }
    func randomize() -> Void{
        let choice = MHDirection.random()
        arrowView.image = choice.toImage()
        directionLabel.text = choice.rawValue.uppercaseString
    }
}