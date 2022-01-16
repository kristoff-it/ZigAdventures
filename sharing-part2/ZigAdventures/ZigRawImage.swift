//
//  ZigRawImage.swift
//  ZigAdventures
//
//  Created by Loris Cro on 16/01/22.
//

import SwiftUI

struct ZigRawImage {
    static let bytes_per_pixel = 4
    
    var width: Int
    var height: Int
    var pixels: Data
    
    init() {
        var w = UInt32()
        var h = UInt32()
        let p = getZeroRawImage(&w, &h)
        
        width = Int(w)
        height = Int(h)
        let count = width * height * ZigRawImage.bytes_per_pixel;
        pixels = Data(bytesNoCopy: p!, count: count, deallocator: .custom(freeZeroRawImage))
    }
}

extension UIImage {
    convenience init?(pixels: Data, width: Int, height: Int) {
        guard width > 0 && height > 0 else { return nil }
        
        guard let providerRef = CGDataProvider(data: pixels as CFData)
            else { return nil }
        guard let cgim = CGImage(
            width: width,
            height: height,
            bitsPerComponent: 8,
            bitsPerPixel: 32,
            bytesPerRow: width * ZigRawImage.bytes_per_pixel,
            space: CGColorSpaceCreateDeviceRGB(),
            bitmapInfo: CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue),
            provider: providerRef,
            decode: nil,
            shouldInterpolate: true,
            intent: .defaultIntent)
        else { return nil }
        self.init(cgImage: cgim)
    }
}


