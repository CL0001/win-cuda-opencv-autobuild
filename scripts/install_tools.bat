@echo off

winget install --id NVIDIA.CUDA -e --accept-package-agreements --accept-source-agreements
winget install --id Microsoft.VisualStudio.2022.BuildTools -e --accept-package-agreements --accept-source-agreements
winget install --id Git.Git -e --accept-package-agreements --accept-source-agreements
winget install --id Kitware.CMake -e --accept-package-agreements --accept-source-agreements

PAUSE