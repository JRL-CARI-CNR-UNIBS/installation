#pragma once
#include <ros/ros.h>

namespace ros_log_color
{
  enum PRINT_COLOR
  {
    BLACK,
    RED,
    GREEN,
    YELLOW,
    BLUE,
    MAGENTA,
    CYAN,
    WHITE,
    BOLDBLACK,
    BOLDRED,
    BOLDGREEN,
    BOLDYELLOW,
    BOLDBLUE,
    BOLDMAGENTA,
    BOLDCYAN,
    BOLDWHITE,
    ENDCOLOR
  };

  std::ostream& operator<<(std::ostream& os, PRINT_COLOR c);
}

#define ROS_BLACK_STREAM(x)       ROS_INFO_STREAM(ros_log_color::PRINT_COLOR::BLACK       << x << ros_log_color::PRINT_COLOR::ENDCOLOR)
#define ROS_RED_STREAM(x)         ROS_INFO_STREAM(ros_log_color::PRINT_COLOR::RED         << x << ros_log_color::PRINT_COLOR::ENDCOLOR)
#define ROS_GREEN_STREAM(x)       ROS_INFO_STREAM(ros_log_color::PRINT_COLOR::GREEN       << x << ros_log_color::PRINT_COLOR::ENDCOLOR)
#define ROS_YELLOW_STREAM(x)      ROS_INFO_STREAM(ros_log_color::PRINT_COLOR::YELLOW      << x << ros_log_color::PRINT_COLOR::ENDCOLOR)
#define ROS_BLUE_STREAM(x)        ROS_INFO_STREAM(ros_log_color::PRINT_COLOR::BLUE        << x << ros_log_color::PRINT_COLOR::ENDCOLOR)
#define ROS_MAGENTA_STREAM(x)     ROS_INFO_STREAM(ros_log_color::PRINT_COLOR::MAGENTA     << x << ros_log_color::PRINT_COLOR::ENDCOLOR)
#define ROS_CYAN_STREAM(x)        ROS_INFO_STREAM(ros_log_color::PRINT_COLOR::CYAN        << x << ros_log_color::PRINT_COLOR::ENDCOLOR)
#define ROS_WHITE_STREAM(x)       ROS_INFO_STREAM(ros_log_color::PRINT_COLOR::WHITE       << x << ros_log_color::PRINT_COLOR::ENDCOLOR)
#define ROS_BOLDBLACK_STREAM(x)   ROS_INFO_STREAM(ros_log_color::PRINT_COLOR::BOLDBLACK   << x << ros_log_color::PRINT_COLOR::ENDCOLOR)
#define ROS_BOLDRED_STREAM(x)     ROS_INFO_STREAM(ros_log_color::PRINT_COLOR::BOLDRED     << x << ros_log_color::PRINT_COLOR::ENDCOLOR)
#define ROS_BOLDGREEN_STREAM(x)   ROS_INFO_STREAM(ros_log_color::PRINT_COLOR::BOLDGREEN   << x << ros_log_color::PRINT_COLOR::ENDCOLOR)
#define ROS_BOLDYELLOW_STREAM(x)  ROS_INFO_STREAM(ros_log_color::PRINT_COLOR::BOLDYELLOW  << x << ros_log_color::PRINT_COLOR::ENDCOLOR)
#define ROS_BOLDBLUE_STREAM(x)    ROS_INFO_STREAM(ros_log_color::PRINT_COLOR::BOLDBLUE    << x << ros_log_color::PRINT_COLOR::ENDCOLOR)
#define ROS_BOLDMAGENTA_STREAM(x) ROS_INFO_STREAM(ros_log_color::PRINT_COLOR::BOLDMAGENTA << x << ros_log_color::PRINT_COLOR::ENDCOLOR)
#define ROS_BOLDCYAN_STREAM(x)    ROS_INFO_STREAM(ros_log_color::PRINT_COLOR::BOLDCYAN    << x << ros_log_color::PRINT_COLOR::ENDCOLOR)
#define ROS_BOLDWHITE_STREAM(x)   ROS_INFO_STREAM(ros_log_color::PRINT_COLOR::BOLDWHITE   << x << ros_log_color::PRINT_COLOR::ENDCOLOR)
