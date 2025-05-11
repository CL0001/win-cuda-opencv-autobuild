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

### Download the Repository
Clone the repository or download it as a ZIP file:
```bash
git clone https://github.com/CL0001/win-cuda-opencv-autobuild.git
```

### Customizing the Build Configuration (Optional)

Before proceeding further, it is good to customize the `build_opencv.bat` script, which can be found in the `scripts` directory. This
customization is important because you need to adjust a few parameters, such as the number of logical processors you want to use (since the
build process happens in parallel) and the GPU target platform for the build.

To determine the number of logical processors available on your system, you can use the following command in your command prompt:
```bash
wmic cpu get NumberOfLogicalProcessors
```

Once you know the number of processors, you can also determine your GPU model, especially if you're not sure which one you have, with this
command:
```bash
nvidia-smi --query-gpu=gpu_name --format=csv,noheader
```

In the `build_opencv.bat` script, you will need to modify the values of the `GPU_ARCHITECTURES` and `NUMBER_OF_CORES` variables at the top.
Adjusting these settings can significantly reduce build time, as they control the number of target GPU architectures and the number of logical
processors used in the parallel build process. To optimize the build, it's recommended to remove all compute capability numbers from
`GPU_ARCHITECTURES` except the one that matches your GPU, and set the `NUMBER_OF_CORES` to the number of processors you want to allocate for
the build process.

| GPU Models | Compute Capability |
|------------|---------------------|
| GeForce RTX 5090, GeForce RTX 5080, GeForce RTX 5070 Ti, GeForce RTX 5070 | **12.0** |
| GeForce RTX 4090, GeForce RTX 4080, GeForce RTX 4070 Ti, GeForce RTX 4070, GeForce RTX 4060 Ti, GeForce RTX 4060, GeForce RTX 4050 | **8.9** |
| GeForce RTX 3090 Ti, GeForce RTX 3090, GeForce RTX 3080 Ti, GeForce RTX 3080, GeForce RTX 3070 Ti, GeForce RTX 3070, GeForce RTX 3060 Ti, GeForce RTX 3060, GeForce RTX 3050 Ti, GeForce RTX 3050 | **8.6** |
| GeForce GTX 1650 Ti, GeForce RTX 2080 Ti, GeForce RTX 2080, GeForce RTX 2070, GeForce RTX 2060 | **7.5** |

If you can't find your GPU here, you can refer to the larger list at https://developer.nvidia.com/cuda-gpus

### Install Tools (Required)
In the scripts directory, you'll find `install_tools.bat` script which will install all tools that are essential for the build process.

| Tool | Purpose |
|------|---------|
| **CUDA Toolkit** | Required for GPU acceleration and parallel computing. |
| **Visual Studio Build Tools** | Essential for building C++ projects on Windows. |
| **Git** | Version control system for managing code and collaboration. |
| **CMake** | Build system generator for C++ projects. |

### Set Up CUDA
After installing the tools, run the `setup_cuda_environment.bat` script to make CUDA available for the build process and for running CUDA-accelerated programs.

### Build OpenCV
Once CUDA is set up, run the `build_opencv.bat` script. The build process may take up to 2 hours, so feel free to do something else in the meantime.

### Generate the Visual Studio Solution
Run the `generate_solution.bat` script to generate a Visual Studio solution. **Be sure to set the solution configuration to Release.** After that, you can start working on your project!

**Adding files**

If you add new files (e.g., `.cpp` or `.h` files), make sure to add them to the `src` or `include` directories. After adding the files, run the `generate_solution.bat` script again to include them in the project.

⚠️ **Note:** You don’t need to close Visual Studio for this, but you may need to reload your solution after rerunning the script. Visual Studio will usually prompt you to do this.