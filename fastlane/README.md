fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## iOS

### ios dev

```sh
[bundle exec] fastlane ios dev
```

Local dev lane: fetch deps, lint, test, coverage

### ios qa_ipa

```sh
[bundle exec] fastlane ios qa_ipa
```

Build Debug/QA IPA for local QA

### ios format

```sh
[bundle exec] fastlane ios format
```

SwiftLint auto-fix

### ios test_only

```sh
[bundle exec] fastlane ios test_only
```

Run tests only with coverage

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
