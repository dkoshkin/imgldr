<!--
 Copyright 2025 Dimitri Koshkin. All rights reserved.
 SPDX-License-Identifier: Apache-2.0
 -->

# Imgldr

[![build](https://github.com/dkoshkin/imgldr/actions/workflows/build.yaml/badge.svg)](https://github.com/dkoshkin/imgldr/actions/workflows/build.yaml)
[![codecov](https://codecov.io/github/dkoshkin/imgldr/graph/badge.svg?token=RUEME4RFZK)](https://codecov.io/github/dkoshkin/imgldr)

**imgldr is a Kubernetes controller for development environments only**
that automatically resolves image pull failures in remote clusters.

The controller monitors remote clusters configured either via kubeconfig
or by discovering all CAPI (Cluster API) managed clusters.
When it detects Pods in `ImagePullBackOff` or `ErrImagePull` status,
imgldr searches for matching images in the local Docker daemon (via mounted Docker socket),
streams the missing image to the target cluster,
and loads it directly into the container runtime on the scheduled node (containerd support first).
The Pod is then retried so it can start without pushing the image to a registry.

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
