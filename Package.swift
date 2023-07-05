// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "SwiftLintFix",
  platforms: [.macOS(.v13)],
  products: [
    .plugin(name: "LintFix", targets: ["LintFix"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.3"),
  ],
  targets: [
    .plugin(
      name: "LintFix",
      capability: .command(
        intent: .custom(verb: "lintfix", description: "lint, fix, and format"),
        permissions: [.writeToPackageDirectory(reason: "Fixes fixable lint issues")]
      ),
      dependencies: [
        "LintFixTool",
        "SwiftFormat",
        "SwiftLintBinary",
      ]
    ),
    .executableTarget(
      name: "LintFixTool",
      dependencies: [
        .product(name: "ArgumentParser", package: "swift-argument-parser"),
      ],
      resources: [
        .process("rules.swiftformat"),
        .process("rules.swiftlint"),
      ]
    ),
    .binaryTarget(
      name: "SwiftFormat",
      url: "https://github.com/nicklockwood/SwiftFormat/releases/download/0.51.12/swiftformat.artifactbundle.zip",
      checksum: "0310600634dda94aeaae6cf305daa6cf2612712dd5760b0791b182db98d0521e"
    ),
    .binaryTarget(
      name: "SwiftLintBinary",
      url: "https://github.com/realm/SwiftLint/releases/download/0.52.3/SwiftLintBinary-macos.artifactbundle.zip",
      checksum: "05cbe202aae733ce395de68557614b0dfea394093d5ee53f57436e4d71bbe12f"
    ),
  ]
)
