# CMakeLists files in this project can
# refer to the root source directory of the project as ${HELLO_SOURCE_DIR} and
# to the root binary directory of the project as ${HELLO_BINARY_DIR}.
cmake_minimum_required (VERSION 2.8.11)
project (XS)
ENABLE_LANGUAGE(Fortran)

set (CMAKE_Fortran_FLAGS_RELEASE "-ffixed-line-length-none")
set (CMAKE_Fortran_FLAGS_DEBUG   "-ffixed-line-length-none")

find_package(PythonInterp)
find_package(PythonLibs)
if (NOT CMAKE_BUILD_TYPE)
  set (CMAKE_BUILD_TYPE RELEASE CACHE STRING
      "Choose the type of build, options are: None Debug Release."
      FORCE)
endif (NOT CMAKE_BUILD_TYPE)

# Recurse into the "Hello" and "Demo" subdirectories. This does not actually
# cause another cmake executable to run. The same process will walk through
# the project's entire directory structure.
add_subdirectory (xs)
