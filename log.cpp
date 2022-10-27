#include <YOUR_PATH/log.h>

namespace ros_log_color
{
std::ostream& operator<<(std::ostream& os, PRINT_COLOR c)
{
  switch(c)
  {
  case BLACK       : os << "\033[30m"  ; break;
  case RED         : os << "\033[31m"  ; break;
  case GREEN       : os << "\033[32m"  ; break;
  case YELLOW      : os << "\033[33m"  ; break;
  case BLUE        : os << "\033[34m"  ; break;
  case MAGENTA     : os << "\033[35m"  ; break;
  case CYAN        : os << "\033[36m"  ; break;
  case WHITE       : os << "\033[37m"  ; break;
  case BOLDBLACK   : os << "\033[1;30m"; break;
  case BOLDRED     : os << "\033[1;31m"; break;
  case BOLDGREEN   : os << "\033[1;32m"; break;
  case BOLDYELLOW  : os << "\033[1;33m"; break;
  case BOLDBLUE    : os << "\033[1;34m"; break;
  case BOLDMAGENTA : os << "\033[1;35m"; break;
  case BOLDCYAN    : os << "\033[1;36m"; break;
  case BOLDWHITE   : os << "\033[1;37m"; break;
  case ENDCOLOR    : os << "\033[0m";    break;
  default          : os << "\033[37m";
  }
  return os;
}
}
