echo "Building Runtime without fix"
cd %~dp0
cd runtime-builder
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Debug
cmake --build . 
cmake --build . --target install
