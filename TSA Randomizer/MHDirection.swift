//
//  MHRandom.swift
//  TSA Randomizer
//
//  Created by Michael Hulet on 4/16/16.
//  Copyright © 2016 Michael Hulet. All rights reserved.
//

import UIKit

enum MHDirection: String{
    case Left
    case Right
    init(bool: Bool){
        self = bool ? .Left : .Right
    }
    func toImage() -> UIImage{
        return UIImage(named: self == .Left ? "left-arrow" : "right-arrow")!
    }
}