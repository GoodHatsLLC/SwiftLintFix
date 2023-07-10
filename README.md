# 🧹 SwiftLintFix

A [swiftlint](https://github.com/realm/swiftlint) + [swiftformat](https://github.com/nicklockwood/SwiftFormat) SPM plugin with [pre-commit](https://github.com/pre-commit/pre-commit) hooks.

----

### Install by adding a dependency to `Package.swift`:
```swift
dependencies: [
  .package(url: "https://github.com/GoodHatsLLC/SwiftLintFix.git", from: "0.1.7")
]
```
See the [conditional dependency setup](https://github.com/GoodHatsLLC/SwiftLintFix/blob/main/conditional-dependency.md) for details on avoiding exposing the dependency if distributing a library.

### Run with:
```bash
swift package plugin lintfix
```

### Add to pre-commit with:
```yaml
# See https://pre-commit.com for more information
# See https://pre-commit.com/hooks.html for more hooks
repos:
-   repo: https://github.com/GoodHatsLLC/SwiftLintFix
    rev: v0.1.7
    hooks:
    -   id: swift_lintfix
```

### Configure the swiftlint and swiftformat configurations by adding config files to your project root:
```
.swiftlint
.swiftformat
```

----

### Credits:

SwiftLintFix was initially forked from [Airbnb's style guide](https://github.com/airbnb/swift).

