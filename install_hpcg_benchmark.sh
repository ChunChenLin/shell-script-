#!/bin/bash

cd
wget http://www.open-mpi.org/software/ompi/v1.10/downloads/openmpi-1.10.1.tar.gz
tar -zxvf openmpi-1.10.1.tar.gz

#export CC=gcc
#export CXX=g++
#export F77=gfortran
#export FC=gfortran

cd openmpi-1.10.1
./configure --prefix=$HOME/openmpi-1.10.1-gcc
make
make install

cd
echo 'export PATH=$HOME/openmpi-1.10.1-gcc/bin:$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=$HOME/openmpi-1.10.1-gcc/lib:$LD_LIBRARY_PATH' >> ~/.bashrc
source ~/.bashrc

cd
wget http://www.hpcg-benchmark.org/downloads/hpcg-3.0.tar.gz
tar -zxvf hpcg-3.0.tar.gz

cd hpcg-3.0
cp setup/Make.MPI_GCC_OMP setup/Make.My_MPI_OMP
mkdir My_MPI_OpenMP
cd My_MPI_OpenMP
~/hpcg-3.0/configure My_MPI_OMP
make

echo -e "\n\n Installation Completed.\a\n\n"

exit 0

