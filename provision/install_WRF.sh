#!/bin/csh

# install WRF

#cd /home/vagrant/wrf/build/source
source ~/.cshrc
cd $SOURCEDIR
curl -O http://www2.mmm.ucar.edu/wrf/src/WRFV3.6.1.TAR.gz
tar xzvf WRFV3.6.1.TAR.gz -C ../build/gcc/
cd ../build/gcc/WRFV3/

echo 'setenv CC gcc' >> ~/.cshrc
echo 'setenv CXX g++' >> ~/.cshrc
echo 'setenv FC gfortran' >> ~/.cshrc
echo 'setenv FCFLAGS -m64' >> ~/.cshrc
echo 'setenv F77 gfortran' >> ~/.cshrc
echo 'setenv FFLAGS -m64' >> ~/.cshrc
echo 'setenv WRFIO_NCD_LARGE_FILE_SUPPORT 1' >> ~/.cshrc
echo 'setenv NETCDF $DIR' >> ~/.cshrc
source ~/.cshrc

#./configure
# choose 34 for platform/compiler and 1 for nesting options
printf "34\n1\n" | ./configure
./compile em_real |& tee log.compile
cd ..

# Note if no executables formed, but no errors, likely to be a memory issue. This might fix it: lower the compiler optimization level from 03 to 02 in the configure.wrf file and recompile.
#FIND WAY TO AUTOMATE THIS WITH SED

# add path to WRF directory
echo 'export WRFDIR='$BUILDDIR'/WRFV3' >> ~/.bashrc
