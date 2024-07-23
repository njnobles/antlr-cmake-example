echo "Building Runtime without fix"
cd %~dp0
cd runtime-builder
mkdir build
cd build
cmake ..
cmake --build .
cmake --build . --target install
