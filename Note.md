##PyMol

1. save a transparent figure  
`set depth_cue, 0; set opaque_background, 0; ray 800, 800; png output_file_name.png`

###(Pymol v1.7)  
`set cartoon_fancy_helices, 1`  

##VMD  
###Tkconsole  
`mol load parm7 *.prmtop mdcrd *mdcrd`

##CentOS
###upside
0. download python3
   `tar -xzvf` python3.tar
   `cd ` the directory
   `./configure`
   `make`
   `make install`
1. `sudo yum install hdf5 hdf5-devel`
2. `sudo easy_install h5py`
3. `sudo yum install eigen3`
4. download python2.7, `./configure`, `make` & `make altinstal`

### GCC
`sudo yum install centos-release-scl`
`sudo yum install devtoolset-6-gcc*`
`scl enable devtoolset-6 bash`

###GMP:
1. `sudo yum install lzip`
2. download gmp (latest version)
3. `./configure`
4. `make & make check & make install`

###MPFR
1. download mpfr (latest version)
2. `./configure`
3. `make & make check & make install`

###MPC
1. download mpc (latest version)
2. `./configure`
3. `make & make check & make install`

###GCC
1. `mkdir gcc & cd gcc`
2. `svn checkout svn://gcc.gnu.org/svn/gcc/trunk .`
3. `mkdir build & cd build`
4. `../configure --enable-multilib`
5. `make & make install`
