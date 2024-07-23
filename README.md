# Test Antlr CMake fix

## runtime-builder

Pulls in Antlr4 using FetchContent and simply builds the runtime.
On Windows, build with:  
```
build-runtime.bat
build-runtime-with-fix.bat
```  
On Linux, build with:  
```
build-runtime.sh
build-runtime-with-fix.sh
```
This will build two versions of the runtime,  
one with the latest commit from the official Antlr4 git repo and  
one from my fork with the cmake fix.

Built artifacts are placed into a folder called `install` in the root of the repo.

## test-project

Build scripts for runtime-builder must be run before running these build scripts.

This is a simple test project with a single main.cpp file that has `#include antlr4-runtime.h`.  
The `with-fix` version will find antlr4-runtime from the `install-with-fix` folder and the non-`with-fix`  
version will find antlr4-runtime from the `install` folder.

On Windows, build with:  
```
build-test.bat
build-test-with-fix.bat
```  
On Linux, build with:  
```
build-test.sh
build-test-with-fix.sh
```

`build-test` should fail to build because it fails to find `antlr4-runtime.h`

`build-test-with-fix` should correctly build because the include directories are 
properly set in `antrl4_static` and `antlr4_shared` targets.

There is also output on configure that shows the includes directories set on the 
`antlr4_static` and `antlr4_shared` targets. Look for `antlr4_static_RUNTIME_INTERFACE_INCLUDES` 
in the configure output.
