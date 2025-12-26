# Container Pipeline Demo

Demo repository with intentional vulnerabilities for testing Qualys container image scanning in Azure DevOps pipelines.

## Vulnerabilities Included

### Base Image
- `node:14.17.0-alpine3.12` - Older Node.js version with known CVEs

### NPM Dependencies (all have known CVEs)
- `lodash@4.17.20` - Prototype pollution
- `axios@0.21.1` - SSRF vulnerability
- `minimist@1.2.5` - Prototype pollution
- `node-fetch@2.6.1` - Exposure of sensitive information
- `serialize-javascript@2.1.0` - Remote code execution
- `y18n@4.0.0` - Prototype pollution
- `ini@1.3.5` - Prototype pollution
- `express@4.17.1` - Various security fixes in later versions

## Pipeline Behavior

The `azure-pipelines.yml` is configured with `failOnSeverity: '4'` (High), meaning the pipeline will fail if any High or Critical vulnerabilities are found.

## Usage

1. Connect this repo to Azure DevOps
2. Create a new pipeline using the existing `azure-pipelines.yml`
3. Run the pipeline
4. Watch it fail due to detected vulnerabilities
