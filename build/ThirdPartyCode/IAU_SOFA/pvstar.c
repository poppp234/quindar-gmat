#include "sofam.h"

int iauPvstar(double pv[2][3], double *ra, double *dec,
              double *pmr, double *pmd, double *px, double *rv)
/*
**  - - - - - - - - - -
**   i a u P v s t a r
**  - - - - - - - - - -
**
**  Convert star position+velocity vector to catalog coordinates.
**
**  This function is part of the International Astronomical Union's
**  SOFA (Standards Of Fundamental Astronomy) software collection.
**
**  Status:  support function.
**
**  Given (Note 1):
**     pv     double[2][3]   pv-vector (AU, AU/day)
**
**  Returned (Note 2):
**     ra     double         right ascension (radians)
**     dec    double         declination (radians)
**     pmr    double         RA proper motion (radians/year)
**     pmd    double         Dec proper motion (radians/year)
**     px     double         parallax (arcsec)
**     rv     double         radial velocity (km/s, positive = receding)
**
**  Returned (function value):
**            int            status:
**                              0 = OK
**                             -1 = superluminal speed (Note 5)
**                             -2 = null position vector
**
**  Notes:
**
**  1) The specified pv-vector is the coordinate direction (and its rate
**     of change) for the date at which the light leaving the star
**     reached the solar-system barycenter.
**
**  2) The star data returned by this function are "observables" for an
**     imaginary observer at the solar-system barycenter.  Proper motion
**     and radial velocity are, strictly, in terms of barycentric
**     coordinate time, TCB.  For most practical applications, it is
**     permissible to neglect the distinction between TCB and ordinary
**     "proper" time on Earth (TT/TAI).  The result will, as a rule, be
**     limited by the intrinsic accuracy of the proper-motion and
**     radial-velocity data;  moreover, the supplied pv-vector is likely
**     to be merely an intermediate result (for example generated by the
**     function iauStarpv), so that a change of time unit will cancel
**     out overall.
**
**     In accordance with normal star-catalog conventions, the object's
**     right ascension and declination are freed from the effects of
**     secular aberration.  The frame, which is aligned to the catalog
**     equator and equinox, is Lorentzian and centered on the SSB.
**
**     Summarizing, the specified pv-vector is for most stars almost
**     identical to the result of applying the standard geometrical
**     "space motion" transformation to the catalog data.  The
**     differences, which are the subject of the Stumpff paper cited
**     below, are:
**
**     (i) In stars with significant radial velocity and proper motion,
**     the constantly changing light-time distorts the apparent proper
**     motion.  Note that this is a classical, not a relativistic,
**     effect.
**
**     (ii) The transformation complies with special relativity.
**
**  3) Care is needed with units.  The star coordinates are in radians
**     and the proper motions in radians per Julian year, but the
**     parallax is in arcseconds; the radial velocity is in km/s, but
**     the pv-vector result is in AU and AU/day.
**
**  4) The proper motions are the rate of change of the right ascension
**     and declination at the catalog epoch and are in radians per Julian
**     year.  The RA proper motion is in terms of coordinate angle, not
**     true angle, and will thus be numerically larger at high
**     declinations.
**
**  5) Straight-line motion at constant speed in the inertial frame is
**     assumed.  If the speed is greater than or equal to the speed of
**     light, the function aborts with an error status.
**
**  6) The inverse transformation is performed by the function iauStarpv.
**
**  Called:
**     iauPn        decompose p-vector into modulus and direction
**     iauPdp       scalar product of two p-vectors
**     iauSxp       multiply p-vector by scalar
**     iauPmp       p-vector minus p-vector
**     iauPm        modulus of p-vector
**     iauPpp       p-vector plus p-vector
**     iauPv2s      pv-vector to spherical
**     iauAnp       normalize angle into range 0 to 2pi
**
**  Reference:
**
**     Stumpff, P., 1985, Astron.Astrophys. 144, 232-240.
**
**  This revision:  2008 May 18
**
**  SOFA release 2010-12-01
**
**  Copyright (C) 2010 IAU SOFA Board.  See notes at end.
*/
{
   double r, x[3], vr, ur[3], vt, ut[3], bett, betr, d, w, del,
          usr[3], ust[3], a, rad, decd, rd;


/* Isolate the radial component of the velocity (AU/day, inertial). */
   iauPn(pv[0], &r, x);
   vr = iauPdp(x, pv[1]);
   iauSxp(vr, x, ur);

/* Isolate the transverse component of the velocity (AU/day, inertial). */
   iauPmp(pv[1], ur, ut);
   vt = iauPm(ut);

/* Special-relativity dimensionless parameters. */
   bett = vt / DC;
   betr = vr / DC;

/* The inertial-to-observed correction terms. */
   d = 1.0 + betr;
   w = 1.0 - betr*betr - bett*bett;
   if (d == 0.0 || w < 0) return -1;
   del = sqrt(w) - 1.0;

/* Apply relativistic correction factor to radial velocity component. */
   w = (betr != 0) ? (betr - del) / (betr * d) : 1.0;
   iauSxp(w, ur, usr);

/* Apply relativistic correction factor to tangential velocity */
/* component.                                                  */
   iauSxp(1.0/d, ut, ust);

/* Combine the two to obtain the observed velocity vector (AU/day). */
   iauPpp(usr, ust, pv[1]);

/* Cartesian to spherical. */
   iauPv2s(pv, &a, dec, &r, &rad, &decd, &rd);
   if (r == 0.0) return -2;

/* Return RA in range 0 to 2pi. */
   *ra = iauAnp(a);

/* Return proper motions in radians per year. */
   *pmr = rad * DJY;
   *pmd = decd * DJY;

/* Return parallax in arcsec. */
   *px = DR2AS / r;

/* Return radial velocity in km/s. */
   *rv = 1e-3 * rd * DAU / DAYSEC;

/* OK status. */
   return 0;

/*----------------------------------------------------------------------
**
**  Copyright (C) 2010
**  Standards Of Fundamental Astronomy Board
**  of the International Astronomical Union.
**
**  =====================
**  SOFA Software License
**  =====================
**
**  NOTICE TO USER:
**
**  BY USING THIS SOFTWARE YOU ACCEPT THE FOLLOWING TERMS AND CONDITIONS
**  WHICH APPLY TO ITS USE.
**
**  1. The Software is owned by the IAU SOFA Board ("SOFA").
**
**  2. Permission is granted to anyone to use the SOFA software for any
**     purpose, including commercial applications, free of charge and
**     without payment of royalties, subject to the conditions and
**     restrictions listed below.
**
**  3. You (the user) may copy and distribute SOFA source code to others,
**     and use and adapt its code and algorithms in your own software,
**     on a world-wide, royalty-free basis.  That portion of your
**     distribution that does not consist of intact and unchanged copies
**     of SOFA source code files is a "derived work" that must comply
**     with the following requirements:
**
**     a) Your work shall be marked or carry a statement that it
**        (i) uses routines and computations derived by you from
**        software provided by SOFA under license to you; and
**        (ii) does not itself constitute software provided by and/or
**        endorsed by SOFA.
**
**     b) The source code of your derived work must contain descriptions
**        of how the derived work is based upon, contains and/or differs
**        from the original SOFA software.
**
**     c) The name(s) of all routine(s) in your derived work shall not
**        include the prefix "iau".
**
**     d) The origin of the SOFA components of your derived work must
**        not be misrepresented;  you must not claim that you wrote the
**        original software, nor file a patent application for SOFA
**        software or algorithms embedded in the SOFA software.
**
**     e) These requirements must be reproduced intact in any source
**        distribution and shall apply to anyone to whom you have
**        granted a further right to modify the source code of your
**        derived work.
**
**     Note that, as originally distributed, the SOFA software is
**     intended to be a definitive implementation of the IAU standards,
**     and consequently third-party modifications are discouraged.  All
**     variations, no matter how minor, must be explicitly marked as
**     such, as explained above.
**
**  4. In any published work or commercial products which includes
**     results achieved by using the SOFA software, you shall
**     acknowledge that the SOFA software was used in obtaining those
**     results.
**
**  5. You shall not cause the SOFA software to be brought into
**     disrepute, either by misuse, or use for inappropriate tasks, or
**     by inappropriate modification.
**
**  6. The SOFA software is provided "as is" and SOFA makes no warranty
**     as to its use or performance.   SOFA does not and cannot warrant
**     the performance or results which the user may obtain by using the
**     SOFA software.  SOFA makes no warranties, express or implied, as
**     to non-infringement of third party rights, merchantability, or
**     fitness for any particular purpose.  In no event will SOFA be
**     liable to the user for any consequential, incidental, or special
**     damages, including any lost profits or lost savings, even if a
**     SOFA representative has been advised of such damages, or for any
**     claim by any third party.
**
**  7. The provision of any version of the SOFA software under the terms
**     and conditions specified herein does not imply that future
**     versions will also be made available under the same terms and
**     conditions.
**
**  Correspondence concerning SOFA software should be addressed as
**  follows:
**
**      By email:  sofa@ukho.gov.uk
**      By post:   IAU SOFA Center
**                 HM Nautical Almanac Office
**                 UK Hydrographic Office
**                 Admiralty Way, Taunton
**                 Somerset, TA1 2DN
**                 United Kingdom
**
**--------------------------------------------------------------------*/
}
