      INTEGER NWP,NELEM,NCH,NSDV
      PARAMETER (NWP=21,NELEM=1,NCH=4,NSDV=NWP+NCH+27+1+1+3)
      DOUBLE PRECISION  ONE, TWO, THREE, FOUR, SIX, ZERO
      PARAMETER (ZERO=0.D0, ONE=1.0D0,TWO=2.0D0)
      PARAMETER (THREE=3.0D0,FOUR=4.0D0,SIX=6.0D0)
      CHARACTER(256) DIR1,DIR2,DIR3
      PARAMETER (DIR1='sphere_int21c.inp',DIR2='prefdir.inp')