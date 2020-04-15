# download-release-asset-action
Downloads an asset from a github release

## Parameters

- **version**: a specific release version or 'latest' for latest version. Defaults to 'latest'
- **repository**: relative path to the repository in the format user/repository e.g.: fabriciobastian/download-release-asset-action
- **file**: name of the file to be downloaded from the release
- _**[out]**_: optional path to the directory where to download the asset file. Defaults to '.'.
- _**[token]**_: optional GitHub access token. See [here](https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line) how to create a personal access token.

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
      uses: fabriciobastian/download-release-asset-action@v1.0.6
      with:
        version: latest
        repository: JsonRpcNet/JsonRpcNet.Docs.Ui
        file: jsonrpcnet-docs-ui.zip
        out: ./some/path/
    # ... more steps
```

For more examples, please look at the workflows in this repository.

# Status

## Latest release tests

[![GitHub build action status](https://github.com/fabriciobastian/download-release-asset-action/workflows/test-latest-release-public/badge.svg)](https://github.com/fabriciobastian/download-release-asset-action/actions)

[![GitHub build action status](https://github.com/fabriciobastian/download-release-asset-action/workflows/test-latest-release-private/badge.svg)](https://github.com/fabriciobastian/download-release-asset-action/actions)

[![GitHub build action status](https://github.com/fabriciobastian/download-release-asset-action/workflows/test-latest-release-public-out/badge.svg)](https://github.com/fabriciobastian/download-release-asset-action/actions)

## Local repository tests

[![GitHub build action status](https://github.com/fabriciobastian/download-release-asset-action/workflows/test-local-public/badge.svg)](https://github.com/fabriciobastian/download-release-asset-action/actions)

[![GitHub build action status](https://github.com/fabriciobastian/download-release-asset-action/workflows/test-local-private/badge.svg)](https://github.com/fabriciobastian/download-release-asset-action/actions)

[![GitHub build action status](https://github.com/fabriciobastian/download-release-asset-action/workflows/test-local-public-out/badge.svg)](https://github.com/fabriciobastian/download-release-asset-action/actions)

# Credits
https://gist.github.com/maxim/6e15aa45ba010ab030c4
