cmake-juce
==========

A [CMake][1] based build system for [Juce][2].

The aim here is to develop a set of CMake files that can be added to the modules created by *The Introjucer* to aid integration with a parent project.

### Instructions

1.  Create a new static library project using *The Introjucer*.  Install the modules to something like <tt>myproject/juce</tt>.
2.  Checkout this repository (or just copy the files) to: <tt>myproject/juce</tt>
3.  Update the parent project's <tt>CMakeLists.txt</tt>.

You should end up with a directory structure that looks like:

    myproject\
      CMakeLists.txt           <-- The CMakeLists.txt file for your project
      juce\
        CMakeLists.txt         |
        cmake\                 |
           juce-linux.cmake    |  -- This repository's files
           juce-osx.cmake      | 
           juce-win32.cmake    |
        myproject.jucer
        Builds\
           ...(ignored)
        JuceLibraryCode\
           ...(good stuff)
        Source\
           ...(ignored)

To statically link [JUCE][2] with your project's <tt>CMakeLists.txt</tt>, follow this example:

```cmake
    add_subdirectory(juce)
    include_directories(${JUCE_INCLUDE_DIRS})
    target_link_libraries( my-app-target ${JUCE_LIBRARIES})
```

### Status

I'm just starting to use these files for my personal projects.  I have built a toy project on osx, but the windows and linux builds are completely untested.  Also, I'm just starting to use [JUCE][2], so it's entirely possible this is a terribly wrong approach to using the library.

So, *caveat utilitor*.

[1]: http://www.cmake.org/cmake/help/documentation.html
[2]: http://www.juce.com/
