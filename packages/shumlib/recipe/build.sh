#!/bin/bash
set -ex

export LIBDIR_OUT=${PREFIX}
export SHUM_OPENMP=true

makefile=make/vm-x86-gfortran-gcc.mk

# Make sure the compilers are those provided by conda
sed -i "s;FPP=cpp;FPP=${CPP};" $makefile
sed -i "/FC=gfortran/d" $makefile
sed -i "/CC=gcc/d" $makefile
sed -i "s;AR=ar;AR=${AR};" $makefile

# Build the libraries
make -f $makefile

# Run tests
make -f $makefile check

# Clean up
make -f $makefile clean-temp
rm -r ${PREFIX}/tests
rm ${PREFIX}/include/{fruit.mod,fruit_util.mod}
rm ${PREFIX}/lib/{libfruit.a,libfruit.so}

# ls $PWD/out/*
# mkdir -p $PREFIX/{include,lib}
# cp -v $PWD/out/include/?_shum_*.{h,mod} $PREFIX/include
# cp -v $PWD/out/include/shumlib_version.h $PREFIX/include
# cp -v $PWD/out/lib/libshum_*.{a,so} $PREFIX/lib