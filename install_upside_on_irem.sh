#! /bin/bash
set -e
#trap 'previous_command=$this_command; this_command=$BASH_COMMAND' DEBUG
#trap 'echo FAILED COMMAND: $previous_command' EXIT

#-----------------------------------------------------------------------------
# This script will download packages for, configure, build and install
# dependencies for Upside.
# Customize the variables (HDF5_VERSION, NUMPY_VERSION, etc.) before running.
#-----------------------------------------------------------------------------

#if [[ $EUID -ne 0 ]]; then
#   echo "This script must be run as root" 1>&2
#   exit 1
#fi

# Creat a directory
#mkdir -p upside_dep
cd upside_dep

#PARALLEL_MAKE=-j4
HDF5_VERSION=hdf5-1.8.18
NUMPY_VERSION=numpy-1.9.1
PRODY_VERSION=ProDy-1.5.1
CYTHON_VERSION=Cython-0.21.1
CVXOPT_VERSION=cvxopt-1.1.7
NUMEXPR_VERSION=numexpr-2.4
SCIPY_VERSION=scipy-0.14.0
TABLES_VERSION=tables-3.1.1
BINUTILS_VERSION=binutils-2.25

# Download packages
#export http_proxy=$HTTP_PROXY https_proxy=$HTTP_PROXY ftp_proxy=$HTTP_PROXY

#wget -nc https://support.hdfgroup.org/ftp/HDF5/current18/src/${HDF5_VERSION}.tar
#wget -nc https://pypi.python.org/packages/41/39/45791d98f1c82789b96d7bdc36f34792d0106b44680fb946d5de9cd5c979/numpy-1.9.1.tar.gz#md5=78842b73560ec378142665e712ae4ad9
#mv ${NUMPY_VERSION}.tar.gz#md5=78842b73560ec378142665e712ae4ad9 ${NUMPY_VERSION}.tar.gz
#wget -nc https://pypi.python.org/packages/71/a5/034f1d65faec86ee56d896effb97989d1d05aabea986f47efd1161eb20ff/ProDy-1.5.1.tar.gz#md5=30bfbc8566269d4c9eb5998ba9025728
#wget -nc https://pypi.python.org/packages/ae/b2/f56de6cea0bf1dcc204a966b95eacb0fc824abda30d4d6eb90b160400ddb/Cython-0.21.1.tar.gz#md5=c59163d7c72c0a0ee5eb84edd17935ed
#wget -nc 
#numpy-1.9.1.tar.gz
#ProDy-1.5.1.tar.gz
#Cython-0.21.1.tar.gz
#cvxopt-1.1.7.tar.gz
#numexpr-2.4.tar.gz
#scipy-0.14.0.tar.gz
#tables-3.1.1.tar.gz

wget -nc https://ftp.gnu.org/gnu/binutils/${BINUTILS_VERSION}.tar.bz2


# Extract Packages
#echo "Extracting tar files ..."
#for f in *.tar*; do tar xfk $f; done

# Step 1. Install HDF5
cd ${HDF5_VERSION}
#./configure
#make
#make install
cd ..

# Step 2. Install Numpy
cd ${NUMPY_VERSION}
#python setup.py build
#python setup.py install
cd ..

# Step 3. Install ProDy
cd ${PRODY_VERSION}
#python setup.py build
#python setup.py install
cd ..

# Step 4. Install Cython
cd ${CYTHON_VERSION}
#python setup.py build
#python setup.py install
cd ..

# Step 5. Install Cvxopt
cd ${CVXOPT_VERSION}
#python setup.py build
#python setup.py install
cd ..

# Step 6. Install Numexpr
cd ${NUMEXPR_VERSION}
#python setup.py build
#python setup.py install
cd ..

# Step 7. Install Scipy
cd ${SCIPY_VERSION}
#python setup.py build
#python setup.py install
cd ..

# Step 8. Install Tables 
cd ${TABLES_VERSION}
#python setup.py build
#python setup.py install
cd ..

# Step 9. binutils
#cd ${BINUTILS_VERSION}
#CC=/usr/local/bin/gcc ./configure
#make
#make install
#hash -r


                                                                   
