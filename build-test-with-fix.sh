echo "Building Test Project without fix"
echo "Expect a failure with unable to find antlr4-runtime.h include"
cd test-project
mkdir build-with-fix
cd build-with-fix
cmake .. -DCMAKE_BUILD_TYPE=Debug -DWITH_FIX=ON
cmake --build .
