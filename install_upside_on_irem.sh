# Download Python 2.7
# ./configure --prefix=~/local
# make -j4
# make install
# wget https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py
# python2.7 ez_setup.py --user
# curl -O https://bootstrap.pypa.io/get-pip.py
# python2.7 get-pip.py
# export PATH=~/.local/bin:$PATH
# pip install --user virtualenv
# pip install tables

#!/bin/bash
set -e

script_path="`dirname $0`"

mkdir -p "$script_path/obj"
mkdir -p "$script_path/run"
cd "$script_path/obj"

if [ "$(basename "$PWD")" != "obj" ] ; then
    echo "internal error"
    exit 1
fi
rm -rf CMakeCache.txt CMakeFiles Makefile cmake_install.cmake

PATH=/home/user_name/local/bin:$PATH HDF5_ROOT=/home/user_name/local cmake ../src -DEIGEN3_INCLUDE_DIR=/home/user_name/local/include/eigen3

make -j4
















#! /bin/bash
set -e
trap 'previous_command=$this_command; this_command=$BASH_COMMAND' DEBUG
trap 'echo FAILED COMMAND: $previous_command' EXIT

#-----------------------------------------------------------------------------
# This script will download packages for, configure, build and install
# dependencies for Upside.
# Customize the variables (HDF5_VERSION, NUMPY_VERSION, etc.) before running.
#-----------------------------------------------------------------------------

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Creat a directory
mkdir -p upside_dep
cd upside_dep

PARALLEL_MAKE=-j4
HDF5_VERSION=hdf5-1.8.14
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

wget -nc https://support.hdfgroup.org/ftp/HDF5/releases/${HDF5_VERSION}/src/${HDF5_VERSION}.tar.gz
wget -nc https://pypi.python.org/packages/41/39/45791d98f1c82789b96d7bdc36f34792d0106b44680fb946d5de9cd5c979/${NUMPY_VERSION}.tar.gz#md5=78842b73560ec378142665e712ae4ad9
#mv ${NUMPY_VERSION}.tar.gz#md5=78842b73560ec378142665e712ae4ad9 ${NUMPY_VERSION}.tar.gz
wget -nc https://pypi.python.org/packages/71/a5/034f1d65faec86ee56d896effb97989d1d05aabea986f47efd1161eb20ff/${PRODY_VERSION}.tar.gz#md5=30bfbc8566269d4c9eb5998ba9025728
wget -nc https://pypi.python.org/packages/ae/b2/f56de6cea0bf1dcc204a966b95eacb0fc824abda30d4d6eb90b160400ddb/${CYTHON_VERSION}.tar.gz#md5=c59163d7c72c0a0ee5eb84edd17935ed
wget -nc https://pypi.python.org/packages/24/42/0cc41cc5c23ff5cde9b3a2a1e89560aeb6af74480e925b4da1e08a1ad2be/${CVXOPT_VERSION}.tar.gz
wget -nc https://pypi.python.org/packages/52/2b/2a0ae329ea41782d55c5165c662117cc22a1dce569d7796627d039f6888e/${NUMEXPR_VERSION}.tar.gz#md5=df7e8d9e9dbb145b56d43c465c2bf854
wget -nc https://pypi.python.org/packages/76/3d/ad5f3d19d553cf4a01fb57dd95dc83d9493e3d289511881d4900e0f17ac0/${SCIPY_VERSION}.tar.gz#md5=d7c7f4ccf8b07b08d6fe49d5cd51f85d
wget -nc https://pypi.python.org/packages/69/db/2c5544686baace15d2e7f3c2363ba865049985cede70d55d7e883240b73d/${TABLES_VERSION}.tar.gz
wget -nc https://ftp.gnu.org/gnu/binutils/${BINUTILS_VERSION}.tar.bz2


# Extract Packages
echo "Extracting tar files ..."
for f in *.tar*; do tar xfk $f; done

# Step 1. Install HDF5
cd ${HDF5_VERSION}
./configure
make ${PARALLEL_MAKE}
make install
cd ..

# Step 2. Install Numpy
cd ${NUMPY_VERSION}
python setup.py build
python setup.py install
cd ..

# Step 3. Install ProDy
cd ${PRODY_VERSION}
python setup.py build
python setup.py install
cd ..

# Step 4. Install Cython
cd ${CYTHON_VERSION}
python setup.py build
python setup.py install
cd ..

# Step 5. Install Cvxopt
cd ${CVXOPT_VERSION}
python setup.py build
python setup.py install
cd ..

# Step 6. Install Numexpr
cd ${NUMEXPR_VERSION}
python setup.py build
python setup.py install
cd ..

# Step 7. Install Scipy
cd ${SCIPY_VERSION}
python setup.py build
python setup.py install
cd ..

# Step 8. Install Tables 
cd ${TABLES_VERSION}
python setup.py build
python setup.py install
cd ..

# Step 9. binutils
cd ${BINUTILS_VERSION}
CC=/usr/local/bin/gcc ./configure
make ${PARALLEL_MAKE}
make install
hash -r

echo "Completed!"

                                                                   
