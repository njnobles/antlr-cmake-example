echo "Building Test Project without fix"
echo "Expect a failure with unable to find antlr4-runtime.h include"
cd %~dp0
cd test-project
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Debug
cmake --build .
