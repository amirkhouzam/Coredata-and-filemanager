//
//  UIView.swift
//  VWNTask
//
//  Created by Amirkhouzam on 01/05/2022.
//

import UIKit

extension UIView{
    
    public var height : CGFloat {
        return self.frame.size.height
    }
    public var width : CGFloat {
        return self.frame.size.width
    }
    public var top : CGFloat {
        return self.frame.origin.y
    }
    public var bottom : CGFloat {
        return self.frame.origin.y + self.frame.size.height
    }
    public var left : CGFloat {
        return self.frame.origin.x
    }
    public var right : CGFloat {
        return self.frame.origin.x + self.frame.size.width
    }
}
