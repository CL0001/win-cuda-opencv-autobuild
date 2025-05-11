# Windows CUDA-Accelerated OpenCV Autobuild

This autobuilder provides a straightforward way to install all the necessary build tools and create stable debug and release builds of a
CUDA-accelerated OpenCV library. It also includes a script to generate a project solution, enabling you to start writing and executing code
immediately after the build is complete.

## Purpose

Setting up third-party libraries in C++ can be challenging, as it often requires building them from source – a process that is notoriously
error-prone and difficult, especially for beginners or those returning to the task after a long break. Even if the build is successful, there
is no guarantee that the library will function as expected.

This autobuilder is designed to simplify the setup for those interested in computer vision and C++, automating the installation and
configuration of a CUDA-accelerated OpenCV environment. It offers a smoother, more predictable experience, from installation to execution.

## Prerequisites

The only thing you'll need to install manually is cuDNN, as it is not tracked by winget and therefore cannot be included in the script.

You can download cuDNN from NVIDIA's official site: https://developer.nvidia.com/cudnn-downloads

The installation steps are straightforward:
1. Select Windows.
2. Choose x86_64.
3. Select 10.
4. Choose the exe (local) version.
5. Download and follow the installation instructions.

## Getting Started

### 1. Download the Repository
Clone the repository or download it as a ZIP file:
```bash
git clone https://github.com/CL0001/win-cuda-opencv-autobuild.git
```

### 2. Install Necessary Tools
In the scripts directory, you'll find `install_tools.bat` script which will install all tools that are essential for the build process.

| Tool | Purpose |
|------|---------|
| **CUDA Toolkit** | Required for GPU acceleration and parallel computing. |
| **Visual Studio Build Tools** | Essential for building C++ projects on Windows. |
| **Git** | Version control system for managing code and collaboration. |
| **CMake** | Build system generator for C++ projects. |

### 3. Set Up CUDA
After installing the tools, run the `setup_cuda_environment.bat` script to make CUDA available for the build process and for running CUDA-accelerated programs.

### 4. Build OpenCV
Once CUDA is set up, run the `build_opencv.bat` script. The build process may take up to 2 hours, so feel free to do something else in the meantime.

### 5. Generate the Visual Studio Solution
Run the `generate_solution.bat` script to generate a Visual Studio solution. **Be sure to set the solution configuration to Release.** After that, you can start working on your project!

**Adding files:** If you add new files (e.g., .cpp or .h files), make sure to add them to the src or include directories. After adding the files, run the generate_solution.bat script again to include them in the project.

⚠️ Note: You don’t need to close Visual Studio for this, but you may need to reload your solution after rerunning the script. Visual Studio will usually prompt you to do this.