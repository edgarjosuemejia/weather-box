#!/bin/csh

# setup directory structure
mkdir WRF3.6.1
cd WRF3.6.1
mkdir build
mkdir build/gcc
mkdir source
mkdir source/libraries

# set paths
echo 'setenv BASEDIR $HOME/WRF3.6.1' >> ~/.cshrc
echo 'setenv SOURCEDIR $BASEDIR/source' >> ~/.cshrc
echo 'setenv BUILDDIR $BASEDIR/build/gcc' >> ~/.cshrc
source ~/.cshrc

cd $SOURCEDIR
#cd /home/vagrant/wrf/build/source

# download source
curl -O http://www.hdfgroup.org/ftp/HDF5/current/src/hdf5-1.8.14.tar.gz
curl -O http://www.ece.uvic.ca/~frodo/jasper/software/jasper-1.900.1.zip
curl -o libpng-1.6.16.tar.gz -L 'http://prdownloads.sourceforge.net/libpng/libpng-1.6.16.tar.gz?download'
curl -O http://www.mpich.org/static/downloads/3.1.3/mpich-3.1.3.tar.gz
curl -O ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-4.3.3.tar.gz
curl -O ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-fortran-4.4.1.tar.gz
curl -o netcdf-cxx4-4.2.1.tar.gz -L https://github.com/Unidata/netcdf-cxx4/archive/v4.2.1.tar.gz
curl -o zlib-1.2.8.tar.gz -L 'http://prdownloads.sourceforge.net/libpng/zlib-1.2.8.tar.gz?download'

# extract folders
foreach name (` ls | grep  -i "tar.gz"`)  
    tar xzvf $name
end
foreach name (`ls *.zip`)  
    unzip $name
end
