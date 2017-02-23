##PyMol

1. save a transparent figure
set depth_cue, 0; set opaque_background, 0; ray 800, 800; png output_file_name.png

(v1.7)
2. set cartoon_fancy_helices, 1

##CentOS
###upside

1. `sudo yum install hdf5 hdf5-devel`
2. `sudo easy_install h5py`
3. `sudo yum install eigen3`


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
