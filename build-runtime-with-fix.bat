echo "Building Runtime with fix"
cd %~dp0
cd runtime-builder
mkdir build-with-fix
cd build-with-fix
cmake .. -DCMAKE_BUILD_TYPE=Debug -DWITH_FIX=ON
cmake --build .
cmake --build . --target install
