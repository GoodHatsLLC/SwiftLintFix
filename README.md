# 🧹 SwiftLintFix

`SwiftLintFix` is a Swift Package Manager plugin which makes it easy to run [swiftlint](https://github.com/realm/swiftlint) and [swiftformat](https://github.com/nicklockwood/SwiftFormat).  
It can be run manually from the command line or in Xcode, or automatically on commit.

----

## Install with Swift Package Manager
Add the dependency to your `Package.swift`
```swift
dependencies: [
  .package(url: "https://github.com/GoodHatsLLC/SwiftLintFix.git", from: "0.1.7")
]
```
If you use `SwiftLintFix` in a library you might want to make it a [conditional dependency](https://github.com/GoodHatsLLC/SwiftLintFix/blob/main/conditional-dependency.md) to avoid exposing it to your users.

## Run from command line
```sh
swift package plugin lintfix
```

## Run automatically on commit
You can configure any tooling to run `SwiftLintFix` from the command line.

`SwiftLintFix` direct supports use via [pre-commit](https://github.com/pre-commit/pre-commit).  
If you use it to manage your `git` hooks you can simply add a section to your `.pre-commit-config.yaml` file.
```yaml
# See https://pre-commit.com for more information
# See https://pre-commit.com/hooks.html for more hooks
repos:
-   repo: https://github.com/GoodHatsLLC/SwiftLintFix
    rev: v0.1.8
    hooks:
    -   id: swift_lintfix
```

## Configure `swiftlint` and `swiftformat`
`SwiftLintFix` runs a default rule set for [swiftlint](https://github.com/realm/swiftlint) 
and [swiftformat](https://github.com/nicklockwood/SwiftFormat) unless it finds their configuration
files at the root of your repo.
```sh
.swiftlint
.swiftformat
```

----

## Credit:

SwiftLintFix was initially forked from [Airbnb's style guide](https://github.com/airbnb/swift).

