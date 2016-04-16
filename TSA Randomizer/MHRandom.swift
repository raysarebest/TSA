//
//  MHRandom.swift
//  TSA Randomizer
//
//  Created by Michael Hulet on 4/16/16.
//  Copyright © 2016 Michael Hulet. All rights reserved.
//

import UIKit

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

private var randomDirections: [MHDirection] = []

class MHRandomDirectionGenerator{
    private let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
    private var requests: [Int] = []
    static let defaultGenerator = MHRandomDirectionGenerator()
    func generate() -> Void{
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        let request = NSMutableURLRequest(URL: NSURL(string: "https://api.random.org/json-rpc/1/invoke")!)
        request.HTTPMethod = "POST"
        request.setValue("application/json-rpc", forHTTPHeaderField: "Content-Type")
        let id = requests.count
        requests.append(id)
        request.HTTPBody = try! NSJSONSerialization.dataWithJSONObject(["jsonrpc": "2.0", "id": id, "method": "generateIntegers", "params": ["apiKey": "09436bd9-cdeb-4073-8c1f-9abe8c635672", "n": 25, "min": 0, "max": 1]], options: .PrettyPrinted)
        let task = session.dataTaskWithRequest(request) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
            defer{
                self.requests.removeAtIndex(self.requests.indexOf(id)!)
                if self.requests.count == 0{
                    dispatch_async(dispatch_get_main_queue(), {
                        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                    })
                }
            }
            if error != nil{
                //Look, I'm lazy and the deadline's in half an hour, ok?
                fatalError()
            }
            guard let response = response as? NSHTTPURLResponse, let data = data else{
                fatalError()
            }
            if response.statusCode == 200{
                let random = (try! NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as! [String: AnyObject])
                print(random)
                for number in (random["result"]!["random"]!!["data"]! as? [Int])!{
                    randomDirections.append(MHDirection(bool: Bool(number)))
                }
            }
        }
        task.resume()
    }
    func next() -> MHDirection{
        guard randomDirections.count > 0 else{
            MHRandomDirectionGenerator.defaultGenerator.generate()
            return MHDirection.random()
        }
        defer{
            randomDirections.removeAtIndex(0)
        }
        return randomDirections[0]
    }
}