#!/bin/sh
#
# This file should remain OS independent
#
# $Id: bootstrap.sh,v 1.4 2012/06/13 01:18:04 clem Exp $
#
# @Copyright@
# @Copyright@
#
# $Log: bootstrap.sh,v $
# Revision 1.4  2012/06/13 01:18:04  clem
# i can't say if it really works but the binary are there, aka it compiles
#
# Revision 1.3  2012/02/09 02:07:12  clem
# added $ROLLSROOT variable to bootstrap-functions.sh
#
# Revision 1.2  2012/02/06 18:36:56  nadya
# compile and install
#
# Revision 1.1  2012/01/28 03:09:35  nadya
# initial, moving from cadd/
#

. $ROLLSROOT/etc/bootstrap-functions.sh

yum --enablerepo base install imake

compile_and_install rocks-vmd
/sbin/ldconfig

compile_and_install hdf5
compile_and_install netcdf
compile_and_install fltk

