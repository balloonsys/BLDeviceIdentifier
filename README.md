# Description
This is a Swift version of [UIDeviceIdentifier](https://github.com/squarefrog/UIDeviceIdentifier) by [Paul Williamson](https://github.com/squarefrog). It allows querying of the current users device, and returns a human formatted string.

It is written as a class method, to allow use without direct instantiation.

## Usage
To use this class, just copy the BLDeviceHardware.swift to your project. Then when you are ready to query the device.

### Code usage

```objective-c
func sampleUsage() {
    if let platform = BLDeviceHardware.platform(), platformString = BLDeviceHardware.platformString() {
        println("\(platform)")
        println("\(platformString)")
        
    } else {
        println("FAILED to detect the model name of current device")
    }
}
```

## Licence
BLDeviceHardware is available under the MIT license. See the LICENSE file for more info.
