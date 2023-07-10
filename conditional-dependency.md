When running [pre-commit](https://github.com/pre-commit/pre-commit), `lintfix` runs with the env var `LINT_FIX=1`.

This allows making a `Package.swift` file which only defines the `SwiftLintFix` dependency when the env var is defined.

```swift
let package = Package(
  name: "MyPackage",
  platforms: [.iOS("15.4")],
  products: [
    .library(
      name: "MyLibrary",
      targets: ["MyTarget"]
    )
  ],
  dependencies: [
    .package(
      url: "https://github.com/GoodHatsLLC/SwiftLintFix.git",
      from: "0.1.5"
    ).contingent(on: Env.requiresSwiftLintFixPlugin)
  ].compactMap { $0 },
  targets: [
    .target(
      name: "MyTarget"
    )
  ]
)

private protocol ConditionalArtifact { }
extension ConditionalArtifact {
  func contingent(on filter: Bool) -> Self? {
    if filter {
      return self
    } else {
      return nil
    }
  }
}
extension Package.Dependency: ConditionalArtifact { }
extension Target: ConditionalArtifact { }
extension Product: ConditionalArtifact { }

private enum Env {
  static let requiresSwiftLintFixPlugin: Bool = {
    ProcessInfo.processInfo.environment["LINT_FIX"] == "1"
 }
}
```
