echo "Building Test Project without fix"
echo "Expect Success"
cd %~dp0
cd test-project
mkdir build-with-fix
cd build-with-fix
cmake .. -DWITH_FIX=ON
cmake --build .