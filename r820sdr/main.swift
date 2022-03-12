//
//  main.swift
//  r820sdr
//
//  Created by Jacky Jack on 10/03/2022.
//

import Foundation




print("Hello, World!")

//var dev:UnsafePointer<rtlsdr_dev> = 0
var devPtr: UnsafePointer<OpaquePointer?>
var dev:OpaquePointer?
let count = rtlsdr_get_device_count()

if count <= 0 {
    print("All gona blow up there is no dongles")
}

rtlsdr_open(&dev, 0)

rtlsdr_close(dev)

print("Number of devices \(count)")
