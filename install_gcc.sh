#! /bin/bash
set -e
trap 'previous_command=$this_command; this_command=$BASH_COMMAND' DEBUG
trap 'echo FAILED COMMAND: $previous_command' EXIT

#-----------------------------------------------------------------------------
# This script will download packages for, configure, build and install a GCC.
# Customize the variables (GCC_VERSION, MPFR_VERSION, etc.) before running.
#-----------------------------------------------------------------------------

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Creat a directory
mkdir -p gcc
cd gcc/
PARALLEL_MAKE=-j4
GCC_VERSION=gcc-6.3.0
MPFR_VERSION=mpfr-3.1.5
GMP_VERSION=gmp-6.1.2
MPC_VERSION=mpc-1.0.3

# Download packages
export http_proxy=$HTTP_PROXY https_proxy=$HTTP_PROXY ftp_proxy=$HTTP_PROXY
wget -nc https://ftp.gnu.org/gnu/gcc/$GCC_VERSION/$GCC_VERSION.tar.gz
wget -nc https://ftp.gnu.org/gnu/gmp/$GMP_VERSION.tar.xz
wget -nc https://ftp.gnu.org/gnu/mpfr/$MPFR_VERSION.tar.xz
wget -nc https://ftp.gnu.org/gnu/mpc/$MPC_VERSION.tar.gz

# Extract Packages
echo "Extracting tar files ..."
for f in *.tar*; do tar xfk $f; done

# Step 1. Install GMP
cd $GMP_VERSION
./configure --enable-shared --enable-static --prefix=/usr/local
make $PARALLEL_MAKE && make check && make install
cd ..

# Step 2. Install MPFR
cd $MPFR_VERSION
./configure --enable-shared --enable-static --prefix=/usr/local --with-gmp=/usr/local
make $PARALLEL_MAKE && make check && make install
cd ..

# Step 3. Install MPC
cd $MPC_VERSION
./configure --enable-shared --enable-static --prefix=/usr/local --with-gmp=/usr/local --with-mpfr=/usr/local
make $PARALLEL_MAKE && make check && make install
cd ..

echo /usr/local/lib/ >> /etc/ld.so.conf
echo /usr/local/lib64/ >> /etc/ld.so.conf
ldconfig


# Step 4. Install GCC
cd $GCC_VERSION
mkdir -p build && cd build
../configure --enable-shared --disable-bootstrap --enable-languages=c,c++ --enable-libgomp --enable-threads=posix --with-gmp=/usr/local --with-mpfr=/usr/local --with-mpc=/usr/local --with-fpmath=sse --disable-multilib
make $PARALLEL_MAKE && make install
ldconfig

trap - EXIT
echo 'Success!'
