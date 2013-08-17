#
# linux platform specific libraries
#

find_package(X11 REQUIRED)
find_package(Freetype REQUIRED)

include_directories(${X11_INCLUDE_DIR})
include_directories(${FREETYPE_INCLUDE_DIRS})
#add_definitions(-DLINUX)
set(JUCE_PLATFORM_SPECIFIC_LIBRARIES
  ${X11_LIBRARIES}
  asound
  ${FREETYPE_LIBRARIES}
  Xinerama)

