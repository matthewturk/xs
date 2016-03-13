# Add executable called "helloDemo" that is built from the source files
# "demo.cxx" and "demo_b.cxx". The extensions are automatically found.
add_executable (xs xs_driver.F90)
target_link_libraries (xs LINK_PUBLIC ${PYTHON_LIBRARIES})
