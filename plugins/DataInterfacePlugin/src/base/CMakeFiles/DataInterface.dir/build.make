# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

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

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /gmat

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /gmat

# Include any dependencies generated for this target.
include plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/depend.make

# Include the progress variables for this target.
include plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/progress.make

# Include the compile flags for this target's objects.
include plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/flags.make

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/command/Set.cpp.o: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/flags.make
plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/command/Set.cpp.o: plugins/DataInterfacePlugin/src/base/command/Set.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /gmat/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/command/Set.cpp.o"
	cd /gmat/plugins/DataInterfacePlugin/src/base && /bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/DataInterface.dir/command/Set.cpp.o -c /gmat/plugins/DataInterfacePlugin/src/base/command/Set.cpp

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/command/Set.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/DataInterface.dir/command/Set.cpp.i"
	cd /gmat/plugins/DataInterfacePlugin/src/base && /bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /gmat/plugins/DataInterfacePlugin/src/base/command/Set.cpp > CMakeFiles/DataInterface.dir/command/Set.cpp.i

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/command/Set.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/DataInterface.dir/command/Set.cpp.s"
	cd /gmat/plugins/DataInterfacePlugin/src/base && /bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /gmat/plugins/DataInterfacePlugin/src/base/command/Set.cpp -o CMakeFiles/DataInterface.dir/command/Set.cpp.s

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/command/Set.cpp.o.requires:
.PHONY : plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/command/Set.cpp.o.requires

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/command/Set.cpp.o.provides: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/command/Set.cpp.o.requires
	$(MAKE) -f plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/build.make plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/command/Set.cpp.o.provides.build
.PHONY : plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/command/Set.cpp.o.provides

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/command/Set.cpp.o.provides.build: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/command/Set.cpp.o

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datainterface/DataInterface.cpp.o: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/flags.make
plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datainterface/DataInterface.cpp.o: plugins/DataInterfacePlugin/src/base/datainterface/DataInterface.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /gmat/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datainterface/DataInterface.cpp.o"
	cd /gmat/plugins/DataInterfacePlugin/src/base && /bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/DataInterface.dir/datainterface/DataInterface.cpp.o -c /gmat/plugins/DataInterfacePlugin/src/base/datainterface/DataInterface.cpp

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datainterface/DataInterface.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/DataInterface.dir/datainterface/DataInterface.cpp.i"
	cd /gmat/plugins/DataInterfacePlugin/src/base && /bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /gmat/plugins/DataInterfacePlugin/src/base/datainterface/DataInterface.cpp > CMakeFiles/DataInterface.dir/datainterface/DataInterface.cpp.i

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datainterface/DataInterface.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/DataInterface.dir/datainterface/DataInterface.cpp.s"
	cd /gmat/plugins/DataInterfacePlugin/src/base && /bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /gmat/plugins/DataInterfacePlugin/src/base/datainterface/DataInterface.cpp -o CMakeFiles/DataInterface.dir/datainterface/DataInterface.cpp.s

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datainterface/DataInterface.cpp.o.requires:
.PHONY : plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datainterface/DataInterface.cpp.o.requires

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datainterface/DataInterface.cpp.o.provides: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datainterface/DataInterface.cpp.o.requires
	$(MAKE) -f plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/build.make plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datainterface/DataInterface.cpp.o.provides.build
.PHONY : plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datainterface/DataInterface.cpp.o.provides

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datainterface/DataInterface.cpp.o.provides.build: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datainterface/DataInterface.cpp.o

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datainterface/FileInterface.cpp.o: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/flags.make
plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datainterface/FileInterface.cpp.o: plugins/DataInterfacePlugin/src/base/datainterface/FileInterface.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /gmat/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datainterface/FileInterface.cpp.o"
	cd /gmat/plugins/DataInterfacePlugin/src/base && /bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/DataInterface.dir/datainterface/FileInterface.cpp.o -c /gmat/plugins/DataInterfacePlugin/src/base/datainterface/FileInterface.cpp

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datainterface/FileInterface.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/DataInterface.dir/datainterface/FileInterface.cpp.i"
	cd /gmat/plugins/DataInterfacePlugin/src/base && /bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /gmat/plugins/DataInterfacePlugin/src/base/datainterface/FileInterface.cpp > CMakeFiles/DataInterface.dir/datainterface/FileInterface.cpp.i

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datainterface/FileInterface.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/DataInterface.dir/datainterface/FileInterface.cpp.s"
	cd /gmat/plugins/DataInterfacePlugin/src/base && /bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /gmat/plugins/DataInterfacePlugin/src/base/datainterface/FileInterface.cpp -o CMakeFiles/DataInterface.dir/datainterface/FileInterface.cpp.s

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datainterface/FileInterface.cpp.o.requires:
.PHONY : plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datainterface/FileInterface.cpp.o.requires

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datainterface/FileInterface.cpp.o.provides: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datainterface/FileInterface.cpp.o.requires
	$(MAKE) -f plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/build.make plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datainterface/FileInterface.cpp.o.provides.build
.PHONY : plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datainterface/FileInterface.cpp.o.provides

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datainterface/FileInterface.cpp.o.provides.build: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datainterface/FileInterface.cpp.o

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/DataReader.cpp.o: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/flags.make
plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/DataReader.cpp.o: plugins/DataInterfacePlugin/src/base/datareader/DataReader.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /gmat/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/DataReader.cpp.o"
	cd /gmat/plugins/DataInterfacePlugin/src/base && /bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/DataInterface.dir/datareader/DataReader.cpp.o -c /gmat/plugins/DataInterfacePlugin/src/base/datareader/DataReader.cpp

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/DataReader.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/DataInterface.dir/datareader/DataReader.cpp.i"
	cd /gmat/plugins/DataInterfacePlugin/src/base && /bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /gmat/plugins/DataInterfacePlugin/src/base/datareader/DataReader.cpp > CMakeFiles/DataInterface.dir/datareader/DataReader.cpp.i

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/DataReader.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/DataInterface.dir/datareader/DataReader.cpp.s"
	cd /gmat/plugins/DataInterfacePlugin/src/base && /bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /gmat/plugins/DataInterfacePlugin/src/base/datareader/DataReader.cpp -o CMakeFiles/DataInterface.dir/datareader/DataReader.cpp.s

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/DataReader.cpp.o.requires:
.PHONY : plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/DataReader.cpp.o.requires

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/DataReader.cpp.o.provides: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/DataReader.cpp.o.requires
	$(MAKE) -f plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/build.make plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/DataReader.cpp.o.provides.build
.PHONY : plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/DataReader.cpp.o.provides

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/DataReader.cpp.o.provides.build: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/DataReader.cpp.o

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/FileReader.cpp.o: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/flags.make
plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/FileReader.cpp.o: plugins/DataInterfacePlugin/src/base/datareader/FileReader.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /gmat/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/FileReader.cpp.o"
	cd /gmat/plugins/DataInterfacePlugin/src/base && /bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/DataInterface.dir/datareader/FileReader.cpp.o -c /gmat/plugins/DataInterfacePlugin/src/base/datareader/FileReader.cpp

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/FileReader.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/DataInterface.dir/datareader/FileReader.cpp.i"
	cd /gmat/plugins/DataInterfacePlugin/src/base && /bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /gmat/plugins/DataInterfacePlugin/src/base/datareader/FileReader.cpp > CMakeFiles/DataInterface.dir/datareader/FileReader.cpp.i

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/FileReader.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/DataInterface.dir/datareader/FileReader.cpp.s"
	cd /gmat/plugins/DataInterfacePlugin/src/base && /bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /gmat/plugins/DataInterfacePlugin/src/base/datareader/FileReader.cpp -o CMakeFiles/DataInterface.dir/datareader/FileReader.cpp.s

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/FileReader.cpp.o.requires:
.PHONY : plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/FileReader.cpp.o.requires

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/FileReader.cpp.o.provides: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/FileReader.cpp.o.requires
	$(MAKE) -f plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/build.make plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/FileReader.cpp.o.provides.build
.PHONY : plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/FileReader.cpp.o.provides

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/FileReader.cpp.o.provides.build: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/FileReader.cpp.o

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/TcopsVHFAscii.cpp.o: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/flags.make
plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/TcopsVHFAscii.cpp.o: plugins/DataInterfacePlugin/src/base/datareader/TcopsVHFAscii.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /gmat/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/TcopsVHFAscii.cpp.o"
	cd /gmat/plugins/DataInterfacePlugin/src/base && /bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/DataInterface.dir/datareader/TcopsVHFAscii.cpp.o -c /gmat/plugins/DataInterfacePlugin/src/base/datareader/TcopsVHFAscii.cpp

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/TcopsVHFAscii.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/DataInterface.dir/datareader/TcopsVHFAscii.cpp.i"
	cd /gmat/plugins/DataInterfacePlugin/src/base && /bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /gmat/plugins/DataInterfacePlugin/src/base/datareader/TcopsVHFAscii.cpp > CMakeFiles/DataInterface.dir/datareader/TcopsVHFAscii.cpp.i

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/TcopsVHFAscii.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/DataInterface.dir/datareader/TcopsVHFAscii.cpp.s"
	cd /gmat/plugins/DataInterfacePlugin/src/base && /bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /gmat/plugins/DataInterfacePlugin/src/base/datareader/TcopsVHFAscii.cpp -o CMakeFiles/DataInterface.dir/datareader/TcopsVHFAscii.cpp.s

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/TcopsVHFAscii.cpp.o.requires:
.PHONY : plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/TcopsVHFAscii.cpp.o.requires

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/TcopsVHFAscii.cpp.o.provides: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/TcopsVHFAscii.cpp.o.requires
	$(MAKE) -f plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/build.make plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/TcopsVHFAscii.cpp.o.provides.build
.PHONY : plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/TcopsVHFAscii.cpp.o.provides

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/TcopsVHFAscii.cpp.o.provides.build: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/TcopsVHFAscii.cpp.o

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/TcopsVHFData.cpp.o: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/flags.make
plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/TcopsVHFData.cpp.o: plugins/DataInterfacePlugin/src/base/datareader/TcopsVHFData.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /gmat/CMakeFiles $(CMAKE_PROGRESS_7)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/TcopsVHFData.cpp.o"
	cd /gmat/plugins/DataInterfacePlugin/src/base && /bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/DataInterface.dir/datareader/TcopsVHFData.cpp.o -c /gmat/plugins/DataInterfacePlugin/src/base/datareader/TcopsVHFData.cpp

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/TcopsVHFData.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/DataInterface.dir/datareader/TcopsVHFData.cpp.i"
	cd /gmat/plugins/DataInterfacePlugin/src/base && /bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /gmat/plugins/DataInterfacePlugin/src/base/datareader/TcopsVHFData.cpp > CMakeFiles/DataInterface.dir/datareader/TcopsVHFData.cpp.i

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/TcopsVHFData.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/DataInterface.dir/datareader/TcopsVHFData.cpp.s"
	cd /gmat/plugins/DataInterfacePlugin/src/base && /bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /gmat/plugins/DataInterfacePlugin/src/base/datareader/TcopsVHFData.cpp -o CMakeFiles/DataInterface.dir/datareader/TcopsVHFData.cpp.s

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/TcopsVHFData.cpp.o.requires:
.PHONY : plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/TcopsVHFData.cpp.o.requires

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/TcopsVHFData.cpp.o.provides: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/TcopsVHFData.cpp.o.requires
	$(MAKE) -f plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/build.make plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/TcopsVHFData.cpp.o.provides.build
.PHONY : plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/TcopsVHFData.cpp.o.provides

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/TcopsVHFData.cpp.o.provides.build: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/TcopsVHFData.cpp.o

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/DataInterfaceCommandFactory.cpp.o: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/flags.make
plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/DataInterfaceCommandFactory.cpp.o: plugins/DataInterfacePlugin/src/base/factory/DataInterfaceCommandFactory.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /gmat/CMakeFiles $(CMAKE_PROGRESS_8)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/DataInterfaceCommandFactory.cpp.o"
	cd /gmat/plugins/DataInterfacePlugin/src/base && /bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/DataInterface.dir/factory/DataInterfaceCommandFactory.cpp.o -c /gmat/plugins/DataInterfacePlugin/src/base/factory/DataInterfaceCommandFactory.cpp

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/DataInterfaceCommandFactory.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/DataInterface.dir/factory/DataInterfaceCommandFactory.cpp.i"
	cd /gmat/plugins/DataInterfacePlugin/src/base && /bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /gmat/plugins/DataInterfacePlugin/src/base/factory/DataInterfaceCommandFactory.cpp > CMakeFiles/DataInterface.dir/factory/DataInterfaceCommandFactory.cpp.i

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/DataInterfaceCommandFactory.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/DataInterface.dir/factory/DataInterfaceCommandFactory.cpp.s"
	cd /gmat/plugins/DataInterfacePlugin/src/base && /bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /gmat/plugins/DataInterfacePlugin/src/base/factory/DataInterfaceCommandFactory.cpp -o CMakeFiles/DataInterface.dir/factory/DataInterfaceCommandFactory.cpp.s

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/DataInterfaceCommandFactory.cpp.o.requires:
.PHONY : plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/DataInterfaceCommandFactory.cpp.o.requires

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/DataInterfaceCommandFactory.cpp.o.provides: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/DataInterfaceCommandFactory.cpp.o.requires
	$(MAKE) -f plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/build.make plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/DataInterfaceCommandFactory.cpp.o.provides.build
.PHONY : plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/DataInterfaceCommandFactory.cpp.o.provides

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/DataInterfaceCommandFactory.cpp.o.provides.build: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/DataInterfaceCommandFactory.cpp.o

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/DataInterfaceFactory.cpp.o: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/flags.make
plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/DataInterfaceFactory.cpp.o: plugins/DataInterfacePlugin/src/base/factory/DataInterfaceFactory.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /gmat/CMakeFiles $(CMAKE_PROGRESS_9)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/DataInterfaceFactory.cpp.o"
	cd /gmat/plugins/DataInterfacePlugin/src/base && /bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/DataInterface.dir/factory/DataInterfaceFactory.cpp.o -c /gmat/plugins/DataInterfacePlugin/src/base/factory/DataInterfaceFactory.cpp

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/DataInterfaceFactory.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/DataInterface.dir/factory/DataInterfaceFactory.cpp.i"
	cd /gmat/plugins/DataInterfacePlugin/src/base && /bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /gmat/plugins/DataInterfacePlugin/src/base/factory/DataInterfaceFactory.cpp > CMakeFiles/DataInterface.dir/factory/DataInterfaceFactory.cpp.i

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/DataInterfaceFactory.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/DataInterface.dir/factory/DataInterfaceFactory.cpp.s"
	cd /gmat/plugins/DataInterfacePlugin/src/base && /bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /gmat/plugins/DataInterfacePlugin/src/base/factory/DataInterfaceFactory.cpp -o CMakeFiles/DataInterface.dir/factory/DataInterfaceFactory.cpp.s

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/DataInterfaceFactory.cpp.o.requires:
.PHONY : plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/DataInterfaceFactory.cpp.o.requires

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/DataInterfaceFactory.cpp.o.provides: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/DataInterfaceFactory.cpp.o.requires
	$(MAKE) -f plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/build.make plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/DataInterfaceFactory.cpp.o.provides.build
.PHONY : plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/DataInterfaceFactory.cpp.o.provides

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/DataInterfaceFactory.cpp.o.provides.build: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/DataInterfaceFactory.cpp.o

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/ReaderFactory.cpp.o: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/flags.make
plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/ReaderFactory.cpp.o: plugins/DataInterfacePlugin/src/base/factory/ReaderFactory.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /gmat/CMakeFiles $(CMAKE_PROGRESS_10)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/ReaderFactory.cpp.o"
	cd /gmat/plugins/DataInterfacePlugin/src/base && /bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/DataInterface.dir/factory/ReaderFactory.cpp.o -c /gmat/plugins/DataInterfacePlugin/src/base/factory/ReaderFactory.cpp

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/ReaderFactory.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/DataInterface.dir/factory/ReaderFactory.cpp.i"
	cd /gmat/plugins/DataInterfacePlugin/src/base && /bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /gmat/plugins/DataInterfacePlugin/src/base/factory/ReaderFactory.cpp > CMakeFiles/DataInterface.dir/factory/ReaderFactory.cpp.i

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/ReaderFactory.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/DataInterface.dir/factory/ReaderFactory.cpp.s"
	cd /gmat/plugins/DataInterfacePlugin/src/base && /bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /gmat/plugins/DataInterfacePlugin/src/base/factory/ReaderFactory.cpp -o CMakeFiles/DataInterface.dir/factory/ReaderFactory.cpp.s

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/ReaderFactory.cpp.o.requires:
.PHONY : plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/ReaderFactory.cpp.o.requires

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/ReaderFactory.cpp.o.provides: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/ReaderFactory.cpp.o.requires
	$(MAKE) -f plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/build.make plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/ReaderFactory.cpp.o.provides.build
.PHONY : plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/ReaderFactory.cpp.o.provides

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/ReaderFactory.cpp.o.provides.build: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/ReaderFactory.cpp.o

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/plugin/GmatPluginFunctions.cpp.o: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/flags.make
plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/plugin/GmatPluginFunctions.cpp.o: plugins/DataInterfacePlugin/src/base/plugin/GmatPluginFunctions.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /gmat/CMakeFiles $(CMAKE_PROGRESS_11)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/plugin/GmatPluginFunctions.cpp.o"
	cd /gmat/plugins/DataInterfacePlugin/src/base && /bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/DataInterface.dir/plugin/GmatPluginFunctions.cpp.o -c /gmat/plugins/DataInterfacePlugin/src/base/plugin/GmatPluginFunctions.cpp

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/plugin/GmatPluginFunctions.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/DataInterface.dir/plugin/GmatPluginFunctions.cpp.i"
	cd /gmat/plugins/DataInterfacePlugin/src/base && /bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /gmat/plugins/DataInterfacePlugin/src/base/plugin/GmatPluginFunctions.cpp > CMakeFiles/DataInterface.dir/plugin/GmatPluginFunctions.cpp.i

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/plugin/GmatPluginFunctions.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/DataInterface.dir/plugin/GmatPluginFunctions.cpp.s"
	cd /gmat/plugins/DataInterfacePlugin/src/base && /bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /gmat/plugins/DataInterfacePlugin/src/base/plugin/GmatPluginFunctions.cpp -o CMakeFiles/DataInterface.dir/plugin/GmatPluginFunctions.cpp.s

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/plugin/GmatPluginFunctions.cpp.o.requires:
.PHONY : plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/plugin/GmatPluginFunctions.cpp.o.requires

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/plugin/GmatPluginFunctions.cpp.o.provides: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/plugin/GmatPluginFunctions.cpp.o.requires
	$(MAKE) -f plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/build.make plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/plugin/GmatPluginFunctions.cpp.o.provides.build
.PHONY : plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/plugin/GmatPluginFunctions.cpp.o.provides

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/plugin/GmatPluginFunctions.cpp.o.provides.build: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/plugin/GmatPluginFunctions.cpp.o

# Object files for target DataInterface
DataInterface_OBJECTS = \
"CMakeFiles/DataInterface.dir/command/Set.cpp.o" \
"CMakeFiles/DataInterface.dir/datainterface/DataInterface.cpp.o" \
"CMakeFiles/DataInterface.dir/datainterface/FileInterface.cpp.o" \
"CMakeFiles/DataInterface.dir/datareader/DataReader.cpp.o" \
"CMakeFiles/DataInterface.dir/datareader/FileReader.cpp.o" \
"CMakeFiles/DataInterface.dir/datareader/TcopsVHFAscii.cpp.o" \
"CMakeFiles/DataInterface.dir/datareader/TcopsVHFData.cpp.o" \
"CMakeFiles/DataInterface.dir/factory/DataInterfaceCommandFactory.cpp.o" \
"CMakeFiles/DataInterface.dir/factory/DataInterfaceFactory.cpp.o" \
"CMakeFiles/DataInterface.dir/factory/ReaderFactory.cpp.o" \
"CMakeFiles/DataInterface.dir/plugin/GmatPluginFunctions.cpp.o"

# External object files for target DataInterface
DataInterface_EXTERNAL_OBJECTS =

application/plugins/libDataInterface.so.R2015a: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/command/Set.cpp.o
application/plugins/libDataInterface.so.R2015a: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datainterface/DataInterface.cpp.o
application/plugins/libDataInterface.so.R2015a: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datainterface/FileInterface.cpp.o
application/plugins/libDataInterface.so.R2015a: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/DataReader.cpp.o
application/plugins/libDataInterface.so.R2015a: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/FileReader.cpp.o
application/plugins/libDataInterface.so.R2015a: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/TcopsVHFAscii.cpp.o
application/plugins/libDataInterface.so.R2015a: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/TcopsVHFData.cpp.o
application/plugins/libDataInterface.so.R2015a: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/DataInterfaceCommandFactory.cpp.o
application/plugins/libDataInterface.so.R2015a: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/DataInterfaceFactory.cpp.o
application/plugins/libDataInterface.so.R2015a: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/ReaderFactory.cpp.o
application/plugins/libDataInterface.so.R2015a: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/plugin/GmatPluginFunctions.cpp.o
application/plugins/libDataInterface.so.R2015a: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/build.make
application/plugins/libDataInterface.so.R2015a: application/bin/libGmatBase.so.R2015a
application/plugins/libDataInterface.so.R2015a: depends/cspice/linux/cspice64/lib/cspice.a
application/plugins/libDataInterface.so.R2015a: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared library ../../../../application/plugins/libDataInterface.so"
	cd /gmat/plugins/DataInterfacePlugin/src/base && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/DataInterface.dir/link.txt --verbose=$(VERBOSE)
	cd /gmat/plugins/DataInterfacePlugin/src/base && $(CMAKE_COMMAND) -E cmake_symlink_library ../../../../application/plugins/libDataInterface.so.R2015a ../../../../application/plugins/libDataInterface.so.R2015a ../../../../application/plugins/libDataInterface.so

application/plugins/libDataInterface.so: application/plugins/libDataInterface.so.R2015a

# Rule to build all files generated by this target.
plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/build: application/plugins/libDataInterface.so
.PHONY : plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/build

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/requires: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/command/Set.cpp.o.requires
plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/requires: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datainterface/DataInterface.cpp.o.requires
plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/requires: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datainterface/FileInterface.cpp.o.requires
plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/requires: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/DataReader.cpp.o.requires
plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/requires: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/FileReader.cpp.o.requires
plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/requires: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/TcopsVHFAscii.cpp.o.requires
plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/requires: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/datareader/TcopsVHFData.cpp.o.requires
plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/requires: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/DataInterfaceCommandFactory.cpp.o.requires
plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/requires: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/DataInterfaceFactory.cpp.o.requires
plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/requires: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/factory/ReaderFactory.cpp.o.requires
plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/requires: plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/plugin/GmatPluginFunctions.cpp.o.requires
.PHONY : plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/requires

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/clean:
	cd /gmat/plugins/DataInterfacePlugin/src/base && $(CMAKE_COMMAND) -P CMakeFiles/DataInterface.dir/cmake_clean.cmake
.PHONY : plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/clean

plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/depend:
	cd /gmat && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /gmat /gmat/plugins/DataInterfacePlugin/src/base /gmat /gmat/plugins/DataInterfacePlugin/src/base /gmat/plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : plugins/DataInterfacePlugin/src/base/CMakeFiles/DataInterface.dir/depend

