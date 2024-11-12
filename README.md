# SwiftNum

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fflexlixrup%2FSwiftNum%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/flexlixrup/SwiftNum)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fflexlixrup%2FSwiftNum%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/flexlixrup/SwiftNum)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

## Overview

SwiftNum (Swift Numerics) provides different numeric functionalities to Swift, similiar to [numpy](https://numpy.org) for Python.

## Requirements

Swift 5.10+

## Installation

### Swift Package Manager

To integrate `SwiftNum` into your Xcode project using Swift Package Manager, follow these steps:

1. Open your project in Xcode.
2. Select `File` > `Swift Packages` > `Add Package Dependency...`.
3. Enter the package repository URL: `https://github.com/flexlixrup/SwiftNum`.
4. Choose the latest release or specify a version range.
5. Add the package to your target.

Alternatively, you can add the following dependency to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/flexlixrup/SwiftNum", from: "0.0.1")
]
```

Then, include `SwiftNum` as a dependency in your target:

```swift
.target(
    name: "YourTargetName",
    dependencies: [
        "SwiftNum"
    ]),
```

## Usage

The full documentation is provided via DocC on [Swift Package Manager](https://swiftpackageindex.com/flexlixrup/SwiftNum).

## Contributing

If you would like to contribute, please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Commit your changes (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Create a new Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

If you have any questions, feel free to open an issue.
