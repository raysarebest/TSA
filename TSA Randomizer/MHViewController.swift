//
//  ViewController.swift
//  TSA Randomizer
//
//  Created by Michael Hulet on 4/15/16.
//  Copyright © 2016 Michael Hulet. All rights reserved.
//

import UIKit

enum MHArrowImages: String{
    case Left = "left-arrow"
    case Right = "right-arrow"
}

class ViewController: UIViewController{
    @IBOutlet weak var arrowView: UIImageView!
    @IBOutlet weak var directionLabel: UILabel!
    override func viewDidLoad() -> Void{
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        randomize()
    }
    override func didReceiveMemoryWarning() -> Void{
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) -> Void{
        randomize()
    }
    func randomize() -> Void{
        if Bool(round(Double(arc4random()) / Double(UINT32_MAX))){
            arrowView.image = UIImage(named: MHArrowImages.Left.rawValue)
            directionLabel.text = "LEFT"
        }
        else{
            arrowView.image = UIImage(named: MHArrowImages.Right.rawValue)
            directionLabel.text = "RIGHT"
        }
    }
}