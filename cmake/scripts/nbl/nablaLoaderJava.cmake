if(DEFINED NBL_ROOT_PATH)
	if(NOT EXISTS ${NBL_ROOT_PATH})
		message(FATAL_ERROR  "NBL_ROOT_PATH as '${NBL_ROOT_PATH}' is invalid!")
	endif()
else()
	message(FATAL_ERROR  "NBL_ROOT_PATH variable must be specified for this script!")
endif()

if(DEFINED NBL_CONFIGURATION)
	if(NBL_CONFIGURATION STREQUAL "Release")
		message(STATUS  "Compiling Loader.java for Release configuration!")
	elseif(NBL_CONFIGURATION STREQUAL "Debug")
		message(STATUS  "Compiling Loader.java for Debug configuration!")
	elseif(NBL_CONFIGURATION STREQUAL "RelWithDebInfo")
		message(STATUS  "Compiling Loader.java for RelWithDebInfo configuration!")
	else()
		message(FATAL_ERROR  "NBL_CONFIGURATION as ${NBL_CONFIGURATION} is invalid!")
	endif()
else()
	message(FATAL_ERROR  "NBL_CONFIGURATION variable must be specified for this script!")
endif()

if(DEFINED NBL_GEN_DIRECTORY)
	if(NOT EXISTS ${NBL_GEN_DIRECTORY})
		message(FATAL_ERROR  "NBL_GEN_DIRECTORY as '${NBL_GEN_DIRECTORY}' is invalid!")
	endif()
else()
	message(FATAL_ERROR  "NBL_GEN_DIRECTORY variable must be specified for this script!")
endif()

if(NOT DEFINED SO_NAME)
	message(FATAL_ERROR  "SO_NAME variable must be specified for this script!")
endif()

if(NOT DEFINED TARGET_NAME_IDENTIFIER)
	message(FATAL_ERROR  "TARGET_NAME_IDENTIFIER variable must be specified for this script!")
endif()

set(PACKAGE_NAME "eu.devsh.${TARGET_NAME_IDENTIFIER}")

if(NBL_CONFIGURATION STREQUAL "Release")
	set(NATIVE_LIB_NAME ${SO_NAME})
elseif(NBL_CONFIGURATION STREQUAL "Debug")
	set(NATIVE_LIB_NAME ${SO_NAME}_d)
elseif(NBL_CONFIGURATION STREQUAL "RelWithDebInfo")
	set(NATIVE_LIB_NAME ${SO_NAME}_rwdi)
endif()

set(NBL_INPUT_ANDROID_JAVALOADER_FILE ${NBL_ROOT_PATH}/android/Loader.java)
set(NBL_OUTPUT_ANDROID_JAVALOADER_FILE ${NBL_GEN_DIRECTORY}/${NBL_CONFIGURATION}/Loader.java)

configure_file("${NBL_INPUT_ANDROID_JAVALOADER_FILE}" "${NBL_OUTPUT_ANDROID_JAVALOADER_FILE}")