## Weather Box
(hey, I had to call it something)
##### An Ubuntu virtual machine running WRF 3.6.1.

WRF (Weather Research and Forecasting) is a mesoscale (regional) numerical weather prediction system developed by the National Center for Atmospheric Research (NCAR) and others.

The software is free to use and is available at http://www2.mmm.ucar.edu/wrf/users/. Installation is rather involved since there are a number of dependencies that need to be installed in the right order. Moreover, the installation steps are dependent on the particular system you are running (You need a *nix based system).

Motivated by my need for an automated build script I decided to create a Vagrant box that provisions a working installation of WRF (and it's preprocessing system WPS) on an Ubuntu 14.04 virtual machine. This in itself may not be that useful - but if your system runs Ubuntu 14.04 you can use the provided scripts to install WRF directly (see notes below). Moreover, you might be able to provision an instance of weather box in the cloud to take advantage of additional computing resources. Or maybe you just think VMs are cool...

Anyway, here we go:


**Required Software** (what I'm using)
- Vagrant 1.6.5 (or later)
- VirtualBox 4.3.20 (or later)

**Required Hardware**
- At least 4Gb or RAM, preferably 8Gb as the VM alone is configured with 4Gb.

**How to make a weather box**

1. clone this repository
2. from root of this directory type: `vagrant up`
3. there is no step 3 but this will undoubtably take a while (a couple of hours on my system) ... coffee?

To connect to your VM (headless by default) type `vagrant ssh`

**Notes**
- You get a VM with a compiled version of WRF 3.6.1 (and WPS) - nothing more. You will still have to read the [documentation]( http://www2.mmm.ucar.edu/wrf/OnLineTutorial/index.htm) to figure out how to use it.
- If a VM isn't your thing, you can still use the scripts contained in /provision to install WRF directly on an Ubuntu 14.04 installation. You will need sudo access. Then run the scripts in the following order (you may need to ```chmod 770``` them first):
```
provision/setup_environment.sh
provision/download_source.sh
provision/install_dependencies.sh
provision/install_WRF.sh
provision/install_WPS.sh
provision/install_tools.sh (optional)
```
- The provisioning bash scripts download all required packages. However, the locations are hard coded and may change at some future time. Please email me if any of links are broken and I'll try to update them.
- If no executables are generated (check the WRF3.6.1/build/gcc/WRFV3/main directory) and there are no errors in the log file, you may have insufficient RAM assigned to your VM (in this case the compilation step silently fails). In this case you will have to recompile WRF with a lower optimization level as follows. First run `clean -a` from the root of the WRFV3 directory. 
Then in the configure.wrf file change any occurrences of `-O3` to `-O2` and recompile.
- At some stage, I want to add some scripts to automate downloading data, running WRF, and some other useful tools (NCL, Domain Wizard etc..) but for now you just get compiled version of WRF and WPS. (There is an install_tools.sh script but this doesn't do a lot right now)
- An exciting possibility that might actually make this box useful is deploying it to AWS using the vagrant AWS provider plugin (https://github.com/mitchellh/vagrant-aws).

Please email me with any comments or questions. Happy WRFing...

** References ** 

- http://www2.mmm.ucar.edu/wrf/OnLineTutorial/compilation_tutorial.php
- http://www.aoddy.com/2014/09/09/how-to-install-wrf-3-6-1-on-ubuntu-14-10-server/
-  http://www.ben-rush.net/blog/?p=12
- http://www.unidata.ucar.edu/software/netcdf/docs/building_netcdf_fortran.html

