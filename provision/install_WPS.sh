#!/bin/csh

# install WPS

#cd /home/vagrant/wrf/build/source
source ~/.cshrc
cd $SOURCEDIR
curl -O http://www2.mmm.ucar.edu/wrf/src/WPSV3.6.1.TAR.gz
tar xzvf WPSV3.6.1.TAR.gz -C ../build/gcc/
cd ../build/gcc/WPS/
echo 'setenv JASPERLIB $DIR/lib' >> ~/.cshrc
echo 'setenv JASPERINC $DIR/include' >> ~/.cshrc
source ~/.cshrc

#./configure # choose option 3
printf "3\n" | ./configure

# edits to configure.wps:
# DM_FC               = mpif90 #FIND WAY TO AUTOMATE THIS WITH SED
sed -i 's/mpif90 -f90=gfortran/mpif90/g' configure.wps

# Set to start on system start
#sudo sed -i "s/#START=yes/START=yes/" /etc/default/beanstalkd

./compile |& tee log.compile 

# add path for shared libraries


echo 'export PATH=$PATH:$HOME/WRF3.6.1/build/gcc/libraries/bin' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=$HOME/WRF3.6.1/build/gcc/libraries/lib' >> ~/.bashrc

# add path to WPS directory
echo 'export WPSDIR='$BUILDDIR'/WPS' >> ~/.bashrc

