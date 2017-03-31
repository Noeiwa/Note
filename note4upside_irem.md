


HDF5
./configure
make install
mv hdf5 ~/local


Install Pytable

#!/bin/bash
export PYTHONPATH=~/local/lib/python2.6/site-packages
export HDF5_DIR=~/local/hdf5
export LD_LIBRARY_PATH=~/local/lib/python2.6/site-packages:~/local/hdf5/lib
python $*
