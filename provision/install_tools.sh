#!/bin/csh

# install tools
source ~/.cshrc

# get geographic data
# wget http://www2.mmm.ucar.edu/wrf/src/wps_files/geog.tar.gz
# http://www2.mmm.ucar.edu/wrf/users/download/get_sources_wps_geog.html

# NB: This is a large amount of data. Think about where you want to put it!!! 

#source ~/.cshrc
#cd $BASEDIR
#mkdir data
#cd data
#mkdir geog
#wget http://www2.mmm.ucar.edu/wrf/src/wps_files/geog_complete.tar.bz2 
#tar -xvjf geog_complete.tar.bz2 geog/

# get Domain Wizard
cd ~
cd $BASEDIR
mkdir tools
cd tools
mkdir DomainWizard
cd DomainWizard
wget http://esrl.noaa.gov/gsd/wrfportal/domainwizard/WRFDomainWizard.zip
unzip WRFDomainWizard.zip

# install ncl - this gives a broken version. Linking to the binaries still doesn't fix the missing fonts!
#http://askubuntu.com/questions/419558/how-to-install-ncl-and-ferret-on-ubuntu
#sudo apt-get install ncl-ncarg
#sudo ln -s /usr/share/ncarg /usr/lib/ncarg

# installation from pre-compiled debian binary
# see http://www.ncl.ucar.edu/Download/linux.shtml
cd $BASEDIR/tools
mkdir ncl
cd ncl
wget https://www.earthsystemgrid.org/download/fileDownload.htm?logicalFileId=820136c8-cd9b-11e4-bb80-00c0f03d5b7c -O ncl_​ncarg-​6.​3.​0.​Linux_​Debian7.​8_​x86_​64_​nodap_​gcc472.​tar.​gz
tar xzvf ncl_​ncarg-​6.​3.​0.​Linux_​Debian7.​8_​x86_​64_​nodap_​gcc472.​tar.​gz
# set paths for using NCL in bash shell
echo 'export NCARG_ROOT=$BASEDIR/tools/ncl' >> ~/.bashrc
echo 'export PATH=$NCARG_ROOT/bin:$PATH' >> ~/.bashrc


