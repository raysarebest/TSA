//
//  ViewController.swift
//  TSA Randomizer
//
//  Created by Michael Hulet on 4/15/16.
//  Copyright © 2016 Michael Hulet. All rights reserved.
//

import UIKit

enum MHDirection: String{
    case Left
    case Right
    init(bool: Bool){
        self = bool ? .Left : .Right
    }
    static func random() -> MHDirection{
        return MHDirection(bool: Bool(round(Double(arc4random()) / Double(UINT32_MAX))))
    }
    func toImage() -> UIImage{
        return UIImage(named: self == .Left ? "left-arrow" : "right-arrow")!
    }
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
        let choice = MHDirection.random()
        arrowView.image = choice.toImage()
        directionLabel.text = choice.rawValue.uppercaseString
    }
}