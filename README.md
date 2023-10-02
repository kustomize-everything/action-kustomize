# Kustomize GitHub Action

[![CodeScene general](https://codescene.io/images/analyzed-by-codescene-badge.svg)](https://codescene.io/projects/44667) [![CodeScene Code Health](https://codescene.io/projects/44667/status-badges/code-health)](https://codescene.io/projects/44667)

This action is a thin wrapper that automates the process of installing Kustomize. Kustomize is a standalone tool to customize Kubernetes objects through a kustomization file.

## Features

- Downloads the specified version of Kustomize.
- Checksums the downloaded Kustomize binary for integrity.
- Caches the downloaded binary to speed up subsequent runs.

## Usage

The Kustomize GitHub Action takes two inputs:

- `version`: (optional) Specifies the version of Kustomize you want to use. Defaults to `5.0.0`.
- `sha256-checksum`: (optional) Provides the SHA256 checksum of the desired Kustomize version for validation. Defaults to the checksum of the Kustomize `5.0.0` version.

### Example

```yaml
steps:
  - name: Install Kustomize
    uses: kustomize-everything/action-kustomize@v1
    with:
      version: '5.0.0'
      sha256-checksum: '2e8c28a80ce213528251f489db8d2dcbea7c63b986c8f7595a39fc76ff871cd7'
```

In this example, the Kustomize GitHub Action installs Kustomize version `5.0.0`. The provided SHA256 checksum is used to verify the integrity of the downloaded binary.

## Caching

To speed up the process in subsequent runs, this action uses the GitHub Action `actions/cache@v3` to cache the downloaded Kustomize binary.

## Support

If you encounter any problems or have suggestions, please open an issue.

## License

This project is released under the MIT License.
