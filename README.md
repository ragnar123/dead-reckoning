

## Task description



Re-implement the dreckon function. Adhere to the following requirements:

 - Speed entries are given in m/s rather than knots
 - Allow for slight symmetric variations, vl, in the speed per leg, sl, entries, i.e. sl ± vl
 - Consequently, variations, di, should be determined for the DR points (xi±dxi, yi±dyi)
 - Compute a scaling factor, fi, per DR point to reflect the size of the position variation. With the scaling factor, use IconScale to scale the Icon used by wmmarker to illustrate graphically the variation
 - The variations in the DRs lead to a range of possible paths; the best case path, coincide with the normal drecon path, and the worst case path ends at point which is offset the most from the target end point, i.e. the railway station. Compute the worst case offset in meters.
 - Explain how your modified drecon works. Include source code
