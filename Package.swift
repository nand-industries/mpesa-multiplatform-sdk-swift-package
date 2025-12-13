// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "MpesaMultiplatformSdk",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(name: "MpesaMultiplatformSdk", targets: ["MpesaMultiplatformSdk"])
    ],
    targets: [
        .binaryTarget(
            name: "MpesaMultiplatformSdk",
            url: "https://github.com/nand-industries/mpesa-multiplatform-sdk/releases/download/2.0.0/MpesaMultiplatformSdk.xcframework.zip",
            checksum: "472176e448a39dcb226f922bba06ffb2ba7be600e77136e70e90af2125d6a154"
        )
    ]
)