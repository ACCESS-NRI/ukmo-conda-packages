# UK Met Office Conda Packages

This repository automates the packaging and distribution of selected [UK Met Office (UKMO)](https://www.metoffice.gov.uk/) software (licensed under the BSD 3-Clause license) as Conda packages.
The built packages are distributed on the [accessnri Anaconda channel](https://anaconda.org/accessnri).

## Available packages
- [`shumlib`](https://anaconda.org/accessnri/shumlib)
- [`mule`](https://anaconda.org/accessnri/mule)
- [`ants`](https://anaconda.org/accessnri/ants)
- [`ugants`](https://anaconda.org/accessnri/ugants)

## How it works
This repository automatically monitors the upstream projects for new releases. When a new version is detected, a corresponding Conda package is built and uploaded to the `accessnri` channel for easy installation.

## Installation
You can install any of these packages using `conda` or `micromamba`:

```bash
conda install accessnri::<package-name>
```