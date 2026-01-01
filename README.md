<!--
 Copyright 2025 Dimitri Koshkin. All rights reserved.
 SPDX-License-Identifier: Apache-2.0
 -->

# Imgldr

[![build](https://github.com/dkoshkin/imgldr/actions/workflows/build.yaml/badge.svg)](https://github.com/dkoshkin/imgldr/actions/workflows/build.yaml)
[![codecov](https://codecov.io/github/dkoshkin/imgldr/graph/badge.svg?token=RUEME4RFZK)](https://codecov.io/github/dkoshkin/imgldr)

This project is a Kubernetes operator designed for development and testing workflows
where pushing images may not be practical, similar to `kind load docker-image`, but for remote clusters.

Instead of requiring images to be tagged, pushed, and pulled,
`imgldr` watches for Pods with `ImagePullBackOff` and `ErrImagePull` conditions in a target cluster.
For eligible images, it streams the image from a local Docker daemon
and imports it directly into the container runtime on the node where the Pod is scheduled.

This is not intended for production use!

## Prerequisites

...

## Usage Instructions

...

## Setup your Dev Environment

1. Install [Devbox][Devbox]
2. Install [direnv][direnv]
   - run `direnv allow`
3. Install [pre-commit][pre-commit-hooks] git hooks
   - run `pre-commit install`

Tip: to see all available make targets with descriptions, simply run `make`.

### Test

```bash
make test
```

This repository is configured with [Codecov][Codecov] but can be removed by modifying `.github/workflows/unit-tests.yml`.

### Build

```bash
make build-snapshot
```

The binary for your OS will be placed in `./dist`,
e.g. `./dist/imgldr_darwin_arm64_v8.0/imgldr`:

### Lint

```bash
make lint
make lint-chart
```

### Pre-commit

```bash
make pre-commit
```

### Helm Chart

```bash
make chart-docs
make schema-chart
```

### Build Tooling

The repository is configured with automation to periodically update dependencies.

- [dependabot action][dependabot-action] to update both Github Actions and Golang `go.mod` dependencies using [Dependabot][Dependabot].
- [devbox action][devbox-action] to update [Devbox][Devbox] packages.

[Devbox]: https://www.jetify.com/docs/devbox/installing-devbox
[direnv]: https://direnv.net/
[Codecov]: https://about.codecov.io/
[pre-commit-hooks]: https://pre-commit.com/#3-install-the-git-hook-scripts
[Dependabot]: https://docs.github.com/en/code-security/getting-started/dependabot-quickstart-guide
[dependabot-action]: https://github.com/dkoshkin/imgldr/actions/workflows/dependabot/dependabot-updates
[devbox-action]: https://github.com/dkoshkin/imgldr/actions/workflows/devbox-dependencies-update.yaml
