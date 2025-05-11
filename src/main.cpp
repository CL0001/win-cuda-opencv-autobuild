#include <opencv2/opencv.hpp>
#include <iostream>

int main()
{
    std::string image_path = RESOURCES_PATH "parrots.png";

    std::cout << image_path;

    cv::Mat image = cv::imread(image_path, cv::IMREAD_COLOR);
    if (image.empty())
    {
        std::cerr << "Failed to load image: " << image_path << std::endl;
        return 1;
    }
    else
    {
        std::cout << "Image loaded successfuly";
    }

    cv::imshow("Loaded Image", image);
    cv::waitKey(0);
    cv::destroyAllWindows();


    std::cin.get();
    return 0;
}