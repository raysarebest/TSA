//
//  MHRandom.swift
//  TSA Randomizer
//
//  Created by Michael Hulet on 4/16/16.
//  Copyright © 2016 Michael Hulet. All rights reserved.
//

import Foundation

extension MHDirection{
    static func random() -> MHDirection{
        return MHDirection(bool: Bool(round(Double(arc4random()) / Double(UINT32_MAX))))
    }
}

extension Double{
    static func random() -> Double{
        return Double(arc4random())
    }
    static func jsRandom() -> Double{
        return random() / Double(UINT32_MAX)
    }
}