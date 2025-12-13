# M-Pesa Multiplatform SDK Swift-Package

Swift Package Manager (SPM) wrapper for the [**M-Pesa Multiplatform SDK**](https://github.com/nand-industries/mpesa-multiplatform-sdk).

This repository provides a **Swift Package Manager-compatible distribution** of the M-Pesa Multiplatform SDK so that iOS/macOS/tvOS/watchOS projects can easily consume the SDK without needing to build or embed the raw Kotlin Multiplatform sources directly.

It ships the **prebuilt Kotlin/Native XCFramework** produced by the core SDK and exposes them as an SPM binary target.

---

## About the Core SDK

The M-Pesa Multiplatform SDK is an **unofficial Kotlin Multiplatform SDK** that simplifies integration with the **Vodacom Mozambique M-Pesa APIs** for Customer-to-Business (C2B) checkout flow, providing UI flow, encryption, and reactive transaction status reporting.

This Swift package wraps that SDK distribution (the XCFramework) so native Swift projects can depend on it using SPM.

---

## Installation (Xcode)

1. Open your Xcode project
2. Go to **File → Add Packages…**
3. Paste this package URL: `https://github.com/nand-industries/mpesa-multiplatform-sdk-swift-package`
4. Select a version: [recommended: use the latest tag](https://github.com/nand-industries/mpesa-multiplatform-sdk-swift-package/tags)
5. [See how to initialize the SDK and use its APIs in the docs ](https://github.com/nand-industries/mpesa-multiplatform-sdk?tab=readme-ov-file#initialize-the-sdk)

---

## IMPORTANT

### Including Compose Resources

You should load resources manually due to [this issue (KT-66790)](https://youtrack.jetbrains.com/issue/KT-66790/Provide-compose-resources-together-with-XCFramework-with-SPM-or-Cocoapods) otherwise you may run into a `MissingResourcesException` when launching the checkout flow in your iOS app.
A similar approach to this [comment](https://youtrack.jetbrains.com/issue/KT-66790/Provide-compose-resources-together-with-XCFramework-with-SPM-or-Cocoapods#focus=Comments-27-10363870.0-0) is required.
1. Download the asset `MpesaMultiplatformSdk.xcframework.zip` from the corresponding release [here](https://github.com/nand-industries/mpesa-multiplatform-sdk/releases).
2. Unzip the file and copy the directory `composeResources` and move it to a directory `compose-resources`
3. In Xcode add the `compose-resources` directory to the **Copy Bundle Resources** build phase


### CADisableMinimumFrameDurationOnPhone
`CADisableMinimumFrameDurationOnPhone` is an iOS app setting (in Info.plist) that developers add to enable smooth, high refresh rates (like 120Hz ProMotion) on compatible iPhones, preventing the system from capping animations at 60Hz.

Make sure to turn ON this setting in your `Info.plist`, to avoid a low performance UI or even a crash.

```xml
<key>CADisableMinimumFrameDurationOnPhone</key>
<true/>
```

---

## License

[Apache License](./LICENSE)