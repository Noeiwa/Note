protnam=$1  
target=$2  
PyMOL ${rootdir}/${protnam}.pdb ${rootdir}/${target}.pdb -cqd 'align '${protnam}', '${target}';   
hide all;   
show cartoon;   
color red, '${target}';   
select loops, resi 760-790;   
center loops;   
rotate x, 0;   
rotate y, 0;   
set depth_cue, 0;   
set opaque_background, off;   
ray 800, 800;   
png '${figdir}/${protnam}'-vs-Native.png;'  
#PyMOL ${rootdir}/lowRMSD-R4.pdb ${rootdir}/lowRMSD-R5.pdb -cqd 'align lowRMSD-R4, lowRMSD-R5; hide all; show cartoon; spectrum count, rainbow; select loops, resi 760-790; center loops; rotate x, 0; rotate y, 0; set depth_cue, 0; set opaque_background, off; ray 800, 800; png '${figdir}/${protnam}'.png;'  
#done  

for i in `cat list0`  
do  
protnam=$i  
PyMOL ${rootdir}/${protnam}.pdb -cd 'hide all; show cartoon; spectrum count, rainbow; select loops, resi 760-790; center loops; set depth_cue, 0; set opaque_background, off; ray 800, 800; png '${figdir}/${protnam}'.png;'  
done  
