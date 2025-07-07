#include "%IMGUI_INCLUDE_DIR%imgui.h"
#include "%IMGUI_INCLUDE_DIR%imgui_freetype.h"

// API for exported functions
#ifndef CIMGUI_API
#define CIMGUI_API extern "C"
#endif

#include <stdio.h>

// Wrap this in a namespace to keep it separate from the C++ API
namespace cimgui
{
extern "C"
{
#include "%OUTPUT_HEADER_NAME%"
}
}
