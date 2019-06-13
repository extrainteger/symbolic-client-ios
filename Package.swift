// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "SymbolicIOSKit",
    products: [
        .library(
            name: "SymbolicIOSKit",
            targets: ["SymbolicIOSKit"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SymbolicIOSKit",
            dependencies: []
        ),
        .testTarget(
            name: "SymbolicIOSKitTests",
            dependencies: ["SymbolicIOSKit"]
        ),
    ]
)
