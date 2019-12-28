# download-release-asset-action
Downloads an asset from a public github release

## Parameters

- **version**: a specific release version or 'latest' for latest version. Defaults to 'latest'
- **repository**: relative path to the repository in the format user/repository e.g.: fabriciobastian/download-release-asset-action
- **file**: name of the file to be downloaded from the release

## Usage example

```yml
name: download-release-asset

on: [push]

jobs:
  test:
    runs-on: ubuntu-latest
    name: YOUR_JOB_NAME
    steps:
    # ... some steps
    - name: Download asset
      uses: fabriciobastian/download-release-asset-action@v1.0.2
      with:
        version: latest
        repository: JsonRpcNet/JsonRpcNet.Docs.Ui
        file: jsonrpcnet-docs-ui.zip
    # ... more steps
```
