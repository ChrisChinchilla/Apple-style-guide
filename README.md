# Apple Style Guide

> [!NOTE]
>
> This project is neither maintained nor endorsed by Apple.

This repository contains a [Vale-compatible](https://github.com/errata-ai/vale) implementation of the [*Apple Style Guide*](https://support.apple.com/guide/applestyleguide/) (June 2025).

__Not complete, and WIP, contributions welcome__.😁
<!-- TODO: Change -->
[![Build Status](https://travis-ci.org/testthedocs/apple.svg?branch=master)](https://travis-ci.org/testthedocs/apple) ![Vale version](https://img.shields.io/badge/vale-%3E%3D%20v1.7.0-blue.svg) ![license](https://img.shields.io/github/license/mashape/apistatus.svg)

## Getting Started

> :exclamation: Requires Vale >= **1.7.0**. :exclamation:
<!-- TODO: Update -->
Download the [latest release](https://github.com/chrischinchilla/apple-style-guide/releases), copy the "apple" directory to your `StylesPath`, and include it in your configuration file:

```ini
# This goes in a file named either `.vale.ini` or `_vale.ini`.
StylesPath = path/to/some/directory
MinAlertLevel = warning # suggestion, warning or error

# Only Markdown and .txt files; change to whatever you're using.
[*.{md,txt}]
# List of styles to load.
BasedOnStyles = apple
```

See [Usage](https://github.com/errata-ai/vale/#usage) for more information.
