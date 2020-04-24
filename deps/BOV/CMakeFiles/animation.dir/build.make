# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/jimmy/Bureau/UCL/Advanced_Numerical_Method/LMECA2300-Project

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/jimmy/Bureau/UCL/Advanced_Numerical_Method/LMECA2300-Project

# Include any dependencies generated for this target.
include deps/BOV/CMakeFiles/animation.dir/depend.make

# Include the progress variables for this target.
include deps/BOV/CMakeFiles/animation.dir/progress.make

# Include the compile flags for this target's objects.
include deps/BOV/CMakeFiles/animation.dir/flags.make

deps/BOV/CMakeFiles/animation.dir/examples/animation.c.o: deps/BOV/CMakeFiles/animation.dir/flags.make
deps/BOV/CMakeFiles/animation.dir/examples/animation.c.o: deps/BOV/examples/animation.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jimmy/Bureau/UCL/Advanced_Numerical_Method/LMECA2300-Project/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object deps/BOV/CMakeFiles/animation.dir/examples/animation.c.o"
	cd /home/jimmy/Bureau/UCL/Advanced_Numerical_Method/LMECA2300-Project/deps/BOV && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/animation.dir/examples/animation.c.o   -c /home/jimmy/Bureau/UCL/Advanced_Numerical_Method/LMECA2300-Project/deps/BOV/examples/animation.c

deps/BOV/CMakeFiles/animation.dir/examples/animation.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/animation.dir/examples/animation.c.i"
	cd /home/jimmy/Bureau/UCL/Advanced_Numerical_Method/LMECA2300-Project/deps/BOV && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jimmy/Bureau/UCL/Advanced_Numerical_Method/LMECA2300-Project/deps/BOV/examples/animation.c > CMakeFiles/animation.dir/examples/animation.c.i

deps/BOV/CMakeFiles/animation.dir/examples/animation.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/animation.dir/examples/animation.c.s"
	cd /home/jimmy/Bureau/UCL/Advanced_Numerical_Method/LMECA2300-Project/deps/BOV && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jimmy/Bureau/UCL/Advanced_Numerical_Method/LMECA2300-Project/deps/BOV/examples/animation.c -o CMakeFiles/animation.dir/examples/animation.c.s

deps/BOV/CMakeFiles/animation.dir/examples/animation.c.o.requires:

.PHONY : deps/BOV/CMakeFiles/animation.dir/examples/animation.c.o.requires

deps/BOV/CMakeFiles/animation.dir/examples/animation.c.o.provides: deps/BOV/CMakeFiles/animation.dir/examples/animation.c.o.requires
	$(MAKE) -f deps/BOV/CMakeFiles/animation.dir/build.make deps/BOV/CMakeFiles/animation.dir/examples/animation.c.o.provides.build
.PHONY : deps/BOV/CMakeFiles/animation.dir/examples/animation.c.o.provides

deps/BOV/CMakeFiles/animation.dir/examples/animation.c.o.provides.build: deps/BOV/CMakeFiles/animation.dir/examples/animation.c.o


# Object files for target animation
animation_OBJECTS = \
"CMakeFiles/animation.dir/examples/animation.c.o"

# External object files for target animation
animation_EXTERNAL_OBJECTS =

deps/BOV/examples/animation: deps/BOV/CMakeFiles/animation.dir/examples/animation.c.o
deps/BOV/examples/animation: deps/BOV/CMakeFiles/animation.dir/build.make
deps/BOV/examples/animation: deps/BOV/lib/libbov.a
deps/BOV/examples/animation: deps/BOV/deps/glad/libglad.a
deps/BOV/examples/animation: deps/BOV/deps/glfw/src/libglfw3.a
deps/BOV/examples/animation: /usr/lib/x86_64-linux-gnu/librt.so
deps/BOV/examples/animation: /usr/lib/x86_64-linux-gnu/libm.so
deps/BOV/examples/animation: /usr/lib/x86_64-linux-gnu/libX11.so
deps/BOV/examples/animation: deps/BOV/CMakeFiles/animation.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jimmy/Bureau/UCL/Advanced_Numerical_Method/LMECA2300-Project/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable examples/animation"
	cd /home/jimmy/Bureau/UCL/Advanced_Numerical_Method/LMECA2300-Project/deps/BOV && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/animation.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
deps/BOV/CMakeFiles/animation.dir/build: deps/BOV/examples/animation

.PHONY : deps/BOV/CMakeFiles/animation.dir/build

deps/BOV/CMakeFiles/animation.dir/requires: deps/BOV/CMakeFiles/animation.dir/examples/animation.c.o.requires

.PHONY : deps/BOV/CMakeFiles/animation.dir/requires

deps/BOV/CMakeFiles/animation.dir/clean:
	cd /home/jimmy/Bureau/UCL/Advanced_Numerical_Method/LMECA2300-Project/deps/BOV && $(CMAKE_COMMAND) -P CMakeFiles/animation.dir/cmake_clean.cmake
.PHONY : deps/BOV/CMakeFiles/animation.dir/clean

deps/BOV/CMakeFiles/animation.dir/depend:
	cd /home/jimmy/Bureau/UCL/Advanced_Numerical_Method/LMECA2300-Project && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jimmy/Bureau/UCL/Advanced_Numerical_Method/LMECA2300-Project /home/jimmy/Bureau/UCL/Advanced_Numerical_Method/LMECA2300-Project/deps/BOV /home/jimmy/Bureau/UCL/Advanced_Numerical_Method/LMECA2300-Project /home/jimmy/Bureau/UCL/Advanced_Numerical_Method/LMECA2300-Project/deps/BOV /home/jimmy/Bureau/UCL/Advanced_Numerical_Method/LMECA2300-Project/deps/BOV/CMakeFiles/animation.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : deps/BOV/CMakeFiles/animation.dir/depend

