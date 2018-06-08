# swiftlogger
[Medium Blog Post](https://medium.com/@sauvik_dolui/developing-a-tiny-logger-in-swift-7221751628e6) Project Repository

### Installtion

1. Download or clone the repository.
2. Indentify the `Logger.swift` from `../SwiftLogger/Debug` and drag and drop the file to your project directory.


### Usages


```swift
// String Message Logging
Log.d("This is a DEBUG message") // DEBUG log
Log.e("This is an ERROR message") // ERROR log
Log.i("This is a INFO message") // INFO log
Log.v("This is a VERBOSE message") // VERBOSE log
Log.w("This is a WARNING message") // WARNING log
Log.s("This is a SEVERE message") // SEVERE Error log



struct Student {
  let name: String
  let rollNum: Int
}
extension Student: CustomDebugStringConvertible {
  var debugDescription: String {
    return "Student[name: \(name), roll: \(rollNum)]"
  }
}

// Logging values
Log.d(Student(name: "Socket", rollNum: 19))
// Prints Student[name: Socket, roll: 19]

```
