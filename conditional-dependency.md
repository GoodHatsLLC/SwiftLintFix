# Conditional `Package.swift` Dependencies

By default, if you import SwiftLintFix as a dependency in your library, your library's users
will see SwiftLintFix as a transitive dependency. That can be undesirable since it's just
dev tooling.

You can structure your `Package.swift` file to avoid this by only depending on SwiftLintFix
if an environment variable is set.

```swift
let package = Package(
  name: "MyPackage",
  platforms: [.iOS("16")],
  products: [
    .library(
      name: "MyLibrary",
      targets: ["MyTarget"]
    )
  ],
  dependencies: [
    .package(
      url: "https://github.com/GoodHatsLLC/SwiftLintFix.git",
      from: "0.1.8"
    ).contingent(on: Env.requiresSwiftLintFixPlugin)
  ].compactMap { $0 },
  targets: [
    .target(
      name: "MyTarget"
    )
  ]
)

// MARK: - Conditional Dependency Setup
import Foundation
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
    ProcessInfo.processInfo.environment["ENABLE_LINT_FIX"] == "1"
 }()
}
```

This repo's [pre-commit hook](https://github.com/GoodHatsLLC/SwiftLintFix/blob/main/.pre-commit-hooks.yaml) is set up to pass `ENABLE_LINT_FIX=1` as an environment variable — so it will work directly with the configuration shown above.
