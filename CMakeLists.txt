cmake_minimum_required(VERSION 2.8.6)
project(juce)

#
# P L A T F O R M S
#
# These add definitions and define a variable: JUCE_PLATFORM_SPECIFIC_LIBRARIES

set(EXTRA_FLAGS)
if(WIN32)
  include(cmake/juce_win32.cmake)
elseif(UNIX)
  if(APPLE)
    include(cmake/juce_osx.cmake)
    set(EXTRA_FLAGS "-x objective-c++")
  else()
    include(cmake/juce_linux.cmake)
  endif()
endif()

#
# F I L E S
#
file(GLOB modules JuceLibraryCode/modules/juce*)
foreach(modpath ${modules})
  get_filename_component(mod ${modpath} NAME)
  file(GLOB mod_srcs ${modpath}/*.cpp ${modpath}/*.h)
  list(APPEND JUCE_SRCS ${mod_srcs})
endforeach()

#
# S T A T I C   L I B R A R Y
#

set_directory_properties(PROPERTIES
  COMPILE_DEFINITIONS         NDEBUG
  COMPILE_DEFINITIONS_DEBUG   DEBUG
  COMPILE_DEFINITIONS_RELEASE NDEBUG
)

include_directories(JuceLibraryCode)
add_library(juce STATIC ${JUCE_SRCS})
target_link_libraries(juce ${JUCE_PLATFORM_SPECIFIC_LIBRARIES})
set_target_properties(juce PROPERTIES COMPILE_FLAGS ${EXTRA_FLAGS})

#
# O U T P U T
#
set(JUCE_LIBRARIES    juce ${JUCE_PLATFORM_SPECIFIC_LIBRARIES} PARENT_SCOPE)
set(JUCE_INCLUDE_DIRS ${CMAKE_CURRENT_SOURCE_DIR}/JuceLibraryCode PARENT_SCOPE)
