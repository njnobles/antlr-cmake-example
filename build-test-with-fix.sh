echo "Building Test Project with fix"
echo "Expect Success"
cd test-project
mkdir build-with-fix
cd build-with-fix
cmake .. -DCMAKE_BUILD_TYPE=Debug -DWITH_FIX=ON
cmake --build .
