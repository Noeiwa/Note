# Pymol script for representing the sectors of a given protein.

delete all
load ****.pdb, main

hide all
bg_color white
show cartoon, (chain A)

color white

set two_sided_lighting, 1
set sphere_quality, 2
set surface_quality, 2
set stick_quality, 10
set cartoon_oval_quality, 10
set cartoon_loop_quality, 6
set cartoon_fancy_helices, 1
set cartoon_fancy_sheets, 1

select blue_sec, resi 263+50+266+201+193+219+172+274+141+252+253+272+58+132+105+173+
set sphere_scale, 0.85, (blue_sec)
show spheres, (blue_sec)
color tv_blue, blue_sec
select green_sec, resi 242+254+255+184+133+190+265+205+215+256+244+237+258+195+33+216+127+227+53+246+220+191+213+204+250+63+46+56+13+14+214+24+78+
set sphere_scale, 0.85, (green_sec)
show spheres, (green_sec)
color tv_green, green_sec
select red_sec, resi 147+167+93+3+98+159+86+119+87+20+7+22+91+64+171+59+28+143+29+10+257+47+4+221+112+25+135+118+8+72+146+241+60+9+232+77+11+168+
set sphere_scale, 0.85, (red_sec)
show spheres, (red_sec)
color tv_red, red_sec


set depth_cue, 0; set opaque_background, off; ray 800, 800; png 1K5N_sectors
