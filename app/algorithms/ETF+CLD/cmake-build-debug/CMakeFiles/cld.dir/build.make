# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.20

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/xuesiyang/Documents/ETF+CLD

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/xuesiyang/Documents/ETF+CLD/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/cld.dir/depend.make
# Include the progress variables for this target.
include CMakeFiles/cld.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/cld.dir/flags.make

CMakeFiles/cld.dir/src/cmd.cpp.o: CMakeFiles/cld.dir/flags.make
CMakeFiles/cld.dir/src/cmd.cpp.o: ../src/cmd.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/xuesiyang/Documents/ETF+CLD/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/cld.dir/src/cmd.cpp.o"
	/opt/homebrew/Cellar/gcc/11.2.0/bin/aarch64-apple-darwin20-g++-11 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/cld.dir/src/cmd.cpp.o -c /Users/xuesiyang/Documents/ETF+CLD/src/cmd.cpp

CMakeFiles/cld.dir/src/cmd.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/cld.dir/src/cmd.cpp.i"
	/opt/homebrew/Cellar/gcc/11.2.0/bin/aarch64-apple-darwin20-g++-11 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/xuesiyang/Documents/ETF+CLD/src/cmd.cpp > CMakeFiles/cld.dir/src/cmd.cpp.i

CMakeFiles/cld.dir/src/cmd.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/cld.dir/src/cmd.cpp.s"
	/opt/homebrew/Cellar/gcc/11.2.0/bin/aarch64-apple-darwin20-g++-11 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/xuesiyang/Documents/ETF+CLD/src/cmd.cpp -o CMakeFiles/cld.dir/src/cmd.cpp.s

CMakeFiles/cld.dir/src/ETF.cpp.o: CMakeFiles/cld.dir/flags.make
CMakeFiles/cld.dir/src/ETF.cpp.o: ../src/ETF.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/xuesiyang/Documents/ETF+CLD/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/cld.dir/src/ETF.cpp.o"
	/opt/homebrew/Cellar/gcc/11.2.0/bin/aarch64-apple-darwin20-g++-11 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/cld.dir/src/ETF.cpp.o -c /Users/xuesiyang/Documents/ETF+CLD/src/ETF.cpp

CMakeFiles/cld.dir/src/ETF.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/cld.dir/src/ETF.cpp.i"
	/opt/homebrew/Cellar/gcc/11.2.0/bin/aarch64-apple-darwin20-g++-11 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/xuesiyang/Documents/ETF+CLD/src/ETF.cpp > CMakeFiles/cld.dir/src/ETF.cpp.i

CMakeFiles/cld.dir/src/ETF.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/cld.dir/src/ETF.cpp.s"
	/opt/homebrew/Cellar/gcc/11.2.0/bin/aarch64-apple-darwin20-g++-11 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/xuesiyang/Documents/ETF+CLD/src/ETF.cpp -o CMakeFiles/cld.dir/src/ETF.cpp.s

CMakeFiles/cld.dir/src/CLD.cpp.o: CMakeFiles/cld.dir/flags.make
CMakeFiles/cld.dir/src/CLD.cpp.o: ../src/CLD.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/xuesiyang/Documents/ETF+CLD/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/cld.dir/src/CLD.cpp.o"
	/opt/homebrew/Cellar/gcc/11.2.0/bin/aarch64-apple-darwin20-g++-11 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/cld.dir/src/CLD.cpp.o -c /Users/xuesiyang/Documents/ETF+CLD/src/CLD.cpp

CMakeFiles/cld.dir/src/CLD.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/cld.dir/src/CLD.cpp.i"
	/opt/homebrew/Cellar/gcc/11.2.0/bin/aarch64-apple-darwin20-g++-11 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/xuesiyang/Documents/ETF+CLD/src/CLD.cpp > CMakeFiles/cld.dir/src/CLD.cpp.i

CMakeFiles/cld.dir/src/CLD.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/cld.dir/src/CLD.cpp.s"
	/opt/homebrew/Cellar/gcc/11.2.0/bin/aarch64-apple-darwin20-g++-11 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/xuesiyang/Documents/ETF+CLD/src/CLD.cpp -o CMakeFiles/cld.dir/src/CLD.cpp.s

CMakeFiles/cld.dir/src/postProcessing.cpp.o: CMakeFiles/cld.dir/flags.make
CMakeFiles/cld.dir/src/postProcessing.cpp.o: ../src/postProcessing.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/xuesiyang/Documents/ETF+CLD/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/cld.dir/src/postProcessing.cpp.o"
	/opt/homebrew/Cellar/gcc/11.2.0/bin/aarch64-apple-darwin20-g++-11 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/cld.dir/src/postProcessing.cpp.o -c /Users/xuesiyang/Documents/ETF+CLD/src/postProcessing.cpp

CMakeFiles/cld.dir/src/postProcessing.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/cld.dir/src/postProcessing.cpp.i"
	/opt/homebrew/Cellar/gcc/11.2.0/bin/aarch64-apple-darwin20-g++-11 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/xuesiyang/Documents/ETF+CLD/src/postProcessing.cpp > CMakeFiles/cld.dir/src/postProcessing.cpp.i

CMakeFiles/cld.dir/src/postProcessing.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/cld.dir/src/postProcessing.cpp.s"
	/opt/homebrew/Cellar/gcc/11.2.0/bin/aarch64-apple-darwin20-g++-11 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/xuesiyang/Documents/ETF+CLD/src/postProcessing.cpp -o CMakeFiles/cld.dir/src/postProcessing.cpp.s

# Object files for target cld
cld_OBJECTS = \
"CMakeFiles/cld.dir/src/cmd.cpp.o" \
"CMakeFiles/cld.dir/src/ETF.cpp.o" \
"CMakeFiles/cld.dir/src/CLD.cpp.o" \
"CMakeFiles/cld.dir/src/postProcessing.cpp.o"

# External object files for target cld
cld_EXTERNAL_OBJECTS =

cld: CMakeFiles/cld.dir/src/cmd.cpp.o
cld: CMakeFiles/cld.dir/src/ETF.cpp.o
cld: CMakeFiles/cld.dir/src/CLD.cpp.o
cld: CMakeFiles/cld.dir/src/postProcessing.cpp.o
cld: CMakeFiles/cld.dir/build.make
cld: /opt/homebrew/lib/libopencv_gapi.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_stitching.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_alphamat.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_aruco.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_barcode.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_bgsegm.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_bioinspired.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_ccalib.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_dnn_objdetect.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_dnn_superres.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_dpm.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_face.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_freetype.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_fuzzy.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_hfs.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_img_hash.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_intensity_transform.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_line_descriptor.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_mcc.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_quality.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_rapid.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_reg.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_rgbd.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_saliency.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_sfm.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_stereo.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_structured_light.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_superres.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_surface_matching.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_tracking.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_videostab.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_viz.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_wechat_qrcode.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_xfeatures2d.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_xobjdetect.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_xphoto.4.5.3.dylib
cld: /opt/homebrew/lib/libboost_program_options-mt.dylib
cld: /opt/homebrew/lib/libopencv_shape.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_highgui.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_datasets.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_plot.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_text.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_ml.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_phase_unwrapping.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_optflow.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_ximgproc.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_video.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_videoio.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_dnn.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_imgcodecs.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_objdetect.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_calib3d.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_features2d.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_flann.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_photo.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_imgproc.4.5.3.dylib
cld: /opt/homebrew/lib/libopencv_core.4.5.3.dylib
cld: CMakeFiles/cld.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/xuesiyang/Documents/ETF+CLD/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX executable cld"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/cld.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/cld.dir/build: cld
.PHONY : CMakeFiles/cld.dir/build

CMakeFiles/cld.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/cld.dir/cmake_clean.cmake
.PHONY : CMakeFiles/cld.dir/clean

CMakeFiles/cld.dir/depend:
	cd /Users/xuesiyang/Documents/ETF+CLD/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/xuesiyang/Documents/ETF+CLD /Users/xuesiyang/Documents/ETF+CLD /Users/xuesiyang/Documents/ETF+CLD/cmake-build-debug /Users/xuesiyang/Documents/ETF+CLD/cmake-build-debug /Users/xuesiyang/Documents/ETF+CLD/cmake-build-debug/CMakeFiles/cld.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/cld.dir/depend
