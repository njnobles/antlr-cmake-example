echo "Building Runtime with fix"
cd runtime-builder
mkdir build-with-fix
cd build-with-fix
cmake .. -DCMAKE_BUILD_TYPE=Debug -DWITH_FIX=ON
cmake --build . --parallel 8
cmake --build . --target install
