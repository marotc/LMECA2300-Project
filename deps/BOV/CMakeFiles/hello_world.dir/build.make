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
include deps/BOV/CMakeFiles/hello_world.dir/depend.make

# Include the progress variables for this target.
include deps/BOV/CMakeFiles/hello_world.dir/progress.make

# Include the compile flags for this target's objects.
include deps/BOV/CMakeFiles/hello_world.dir/flags.make

deps/BOV/CMakeFiles/hello_world.dir/examples/hello_world.c.o: deps/BOV/CMakeFiles/hello_world.dir/flags.make
deps/BOV/CMakeFiles/hello_world.dir/examples/hello_world.c.o: deps/BOV/examples/hello_world.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jimmy/Bureau/UCL/Advanced_Numerical_Method/LMECA2300-Project/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object deps/BOV/CMakeFiles/hello_world.dir/examples/hello_world.c.o"
	cd /home/jimmy/Bureau/UCL/Advanced_Numerical_Method/LMECA2300-Project/deps/BOV && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/hello_world.dir/examples/hello_world.c.o   -c /home/jimmy/Bureau/UCL/Advanced_Numerical_Method/LMECA2300-Project/deps/BOV/examples/hello_world.c

deps/BOV/CMakeFiles/hello_world.dir/examples/hello_world.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/hello_world.dir/examples/hello_world.c.i"
	cd /home/jimmy/Bureau/UCL/Advanced_Numerical_Method/LMECA2300-Project/deps/BOV && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jimmy/Bureau/UCL/Advanced_Numerical_Method/LMECA2300-Project/deps/BOV/examples/hello_world.c > CMakeFiles/hello_world.dir/examples/hello_world.c.i

deps/BOV/CMakeFiles/hello_world.dir/examples/hello_world.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/hello_world.dir/examples/hello_world.c.s"
	cd /home/jimmy/Bureau/UCL/Advanced_Numerical_Method/LMECA2300-Project/deps/BOV && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jimmy/Bureau/UCL/Advanced_Numerical_Method/LMECA2300-Project/deps/BOV/examples/hello_world.c -o CMakeFiles/hello_world.dir/examples/hello_world.c.s

deps/BOV/CMakeFiles/hello_world.dir/examples/hello_world.c.o.requires:

.PHONY : deps/BOV/CMakeFiles/hello_world.dir/examples/hello_world.c.o.requires

deps/BOV/CMakeFiles/hello_world.dir/examples/hello_world.c.o.provides: deps/BOV/CMakeFiles/hello_world.dir/examples/hello_world.c.o.requires
	$(MAKE) -f deps/BOV/CMakeFiles/hello_world.dir/build.make deps/BOV/CMakeFiles/hello_world.dir/examples/hello_world.c.o.provides.build
.PHONY : deps/BOV/CMakeFiles/hello_world.dir/examples/hello_world.c.o.provides

deps/BOV/CMakeFiles/hello_world.dir/examples/hello_world.c.o.provides.build: deps/BOV/CMakeFiles/hello_world.dir/examples/hello_world.c.o


# Object files for target hello_world
hello_world_OBJECTS = \
"CMakeFiles/hello_world.dir/examples/hello_world.c.o"

# External object files for target hello_world
hello_world_EXTERNAL_OBJECTS =

deps/BOV/examples/hello_world: deps/BOV/CMakeFiles/hello_world.dir/examples/hello_world.c.o
deps/BOV/examples/hello_world: deps/BOV/CMakeFiles/hello_world.dir/build.make
deps/BOV/examples/hello_world: deps/BOV/lib/libbov.a
deps/BOV/examples/hello_world: deps/BOV/deps/glad/libglad.a
deps/BOV/examples/hello_world: deps/BOV/deps/glfw/src/libglfw3.a
deps/BOV/examples/hello_world: /usr/lib/x86_64-linux-gnu/librt.so
deps/BOV/examples/hello_world: /usr/lib/x86_64-linux-gnu/libm.so
deps/BOV/examples/hello_world: /usr/lib/x86_64-linux-gnu/libX11.so
deps/BOV/examples/hello_world: deps/BOV/CMakeFiles/hello_world.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jimmy/Bureau/UCL/Advanced_Numerical_Method/LMECA2300-Project/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable examples/hello_world"
	cd /home/jimmy/Bureau/UCL/Advanced_Numerical_Method/LMECA2300-Project/deps/BOV && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/hello_world.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
deps/BOV/CMakeFiles/hello_world.dir/build: deps/BOV/examples/hello_world

.PHONY : deps/BOV/CMakeFiles/hello_world.dir/build

deps/BOV/CMakeFiles/hello_world.dir/requires: deps/BOV/CMakeFiles/hello_world.dir/examples/hello_world.c.o.requires

.PHONY : deps/BOV/CMakeFiles/hello_world.dir/requires

deps/BOV/CMakeFiles/hello_world.dir/clean:
	cd /home/jimmy/Bureau/UCL/Advanced_Numerical_Method/LMECA2300-Project/deps/BOV && $(CMAKE_COMMAND) -P CMakeFiles/hello_world.dir/cmake_clean.cmake
.PHONY : deps/BOV/CMakeFiles/hello_world.dir/clean

deps/BOV/CMakeFiles/hello_world.dir/depend:
	cd /home/jimmy/Bureau/UCL/Advanced_Numerical_Method/LMECA2300-Project && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jimmy/Bureau/UCL/Advanced_Numerical_Method/LMECA2300-Project /home/jimmy/Bureau/UCL/Advanced_Numerical_Method/LMECA2300-Project/deps/BOV /home/jimmy/Bureau/UCL/Advanced_Numerical_Method/LMECA2300-Project /home/jimmy/Bureau/UCL/Advanced_Numerical_Method/LMECA2300-Project/deps/BOV /home/jimmy/Bureau/UCL/Advanced_Numerical_Method/LMECA2300-Project/deps/BOV/CMakeFiles/hello_world.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : deps/BOV/CMakeFiles/hello_world.dir/depend

