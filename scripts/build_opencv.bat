@echo off

set GPU_ARCHITECTURES=7.5,8.6,8.9,12.0
set NUMBER_OF_CORES=12

set START_TIME=%time%

if not exist ..\dependencies\opencv_src\opencv (
    git clone https://github.com/opencv/opencv.git --branch 4.10.0 ..\dependencies\opencv_src\opencv
) else (
    echo opencv core found
)

if not exist ..\dependencies\opencv_src\opencv_contrib (
    git clone https://github.com/opencv/opencv_contrib.git --branch 4.10.0 ..\dependencies\opencv_src\opencv_contrib
) else (
    echo opencv contrib found
)

if not exist ..\dependencies\opencv_build (
    cmake -S ..\dependencies\opencv_src\opencv -B ..\dependencies\opencv_build -G "Visual Studio 17 2022" ^
    -DOPENCV_EXTRA_MODULES_PATH=..\dependencies\opencv_src\opencv_contrib\modules ^
    -DWITH_CUDA=ON ^
    -DWITH_CUDNN=ON ^
    -DBUILD_opencv_dnn=ON ^
    -DBUILD_opencv_cudev=ON ^
    -DBUILD_opencv_videoio=ON ^
    -DBUILD_opencv_imgcodecs=ON ^
    -DBUILD_opencv_video=ON ^
    -DBUILD_opencv_world=ON ^
    -DBUILD_JAVA=OFF ^
    -DBUILD_opencv_java_bindings_generator=OFF ^
    -DBUILD_opencv_python_bindings_generator=OFF ^
    -DBUILD_opencv_python_tests=OFF ^
    -DBUILD_opencv_ts=OFF ^
    -DENABLE_FAST_MATH=ON ^
    -DWITH_FFMPEG=ON ^
    -DWITH_JPEG=ON ^
    -DWITH_PNG=ON ^
    -DWITH_TIFF=ON ^
    -DWITH_WEBP=ON ^
    -DWITH_OPENEXR=ON ^
    -DCUDA_ARCH_BIN=%GPU_ARCHITECTURES% ^
    -DCUDA_ARCH_PTX=%GPU_ARCHITECTURES% ^
    -DCMAKE_CONFIGURATION_TYPES=Release ^
    -DCMAKE_BUILD_TYPE=Release

    cmake --build ..\dependencies\opencv_build --target INSTALL --config Release --parallel %NUMBER_OF_CORES%
) else (
    echo ..\dependencies\opencv_build already exists
)

set END_TIME=%time%

for /f %%a in ('powershell -command "& { $start=[datetime]::Parse('%START_TIME%'); $end=[datetime]::Parse('%END_TIME%'); $elapsed=$end-$start; $elapsed.ToString('hh\:mm\:ss') }"') do set ELAPSED_TIME=%%a

echo -
echo Build finished successfully
echo Start time: %START_TIME%
echo End time: %END_TIME%
echo Elapsed time: %ELAPSED_TIME%

PAUSE