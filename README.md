# 🕸️ .NET Helm CLI

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Test](https://github.com/devantler-tech/dotnet-helm-cli/actions/workflows/test.yaml/badge.svg)](https://github.com/devantler-tech/dotnet-helm-cli/actions/workflows/test.yaml)
[![codecov](https://codecov.io/gh/devantler-tech/dotnet-helm-cli/graph/badge.svg?token=RhQPb4fE7z)](https://codecov.io/gh/devantler-tech/dotnet-helm-cli)

A simple .NET library that embeds the Helm CLI.

## 🚀 Getting Started

### Prerequisites

- .NET 9.0 or later
- [Helm CLI](https://helm.sh/docs/intro/install/) installed and available in your system's PATH

### Installation

To get started, you can install the package from NuGet.

```bash
dotnet add package DevantlerTech.HelmCLI
```

## 📝 Usage

You can execute the Helm CLI commands using the `Helm` class.

```csharp
using DevantlerTech.HelmCLI;

var (exitCode, output) = await Helm.RunAsync(["arg1", "arg2"]);
```
