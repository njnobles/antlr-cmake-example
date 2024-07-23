echo "Building Runtime without fix"
cd runtime-builder
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Debug
cmake --build . --parallel 8
cmake --build . --target install
