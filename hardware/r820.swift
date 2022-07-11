//
//  r820.swift
//  r820sdr-init
//
//  Created by Jacky Jack on 15/03/2022.
//

import Foundation

public class R820API {
    
    
    func R820() {
        print("Start device API")
    }
    
    func getDeviceCount() -> UInt32 {
        return rtlsdr_get_device_count()
    }
    
    
    
}

public class R820Tuner {
    var deviceInitalized:Bool = false
    var dev:       OpaquePointer?  = nil
    
    /**
            Function to initialise tunner
        - Parameters:
            -
     */
    func R820Tuner() {
        print("Initialise tunner")
    }
    
    func open(index devId: UInt32) {
        let err = rtlsdr_open(&dev,devId)
        if (err != 0) {
            print("Error couldnt open device")
            return
        }
        deviceInitalized = true
    }
    
    func close() {
        if self.deviceInitalized {
            rtlsdr_close(dev);
            dev = nil
        }
    }
    
    func getCenterFrequency()->UInt32 {
        return rtlsdr_get_center_freq(dev)
    }
    
    func setCenterFrequency(freq: UInt32) -> Int32 {
        return rtlsdr_set_center_freq(dev, freq)
    }
    
    func getSampleRate() -> UInt32 {
        return rtlsdr_get_sample_rate(dev)
    }
    
    func setSampleRate(samplerate: UInt32) -> Int32 {
        return rtlsdr_set_sample_rate(dev, samplerate)
    }
    
    
    
}
