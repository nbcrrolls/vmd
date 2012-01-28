#!/bin/sh
#
# This file should remain OS independent
#
# $Id: bootstrap.sh,v 1.1 2012/01/28 03:09:35 nadya Exp $
#
# @Copyright@
# @Copyright@
#
# $Log: bootstrap.sh,v $
# Revision 1.1  2012/01/28 03:09:35  nadya
# initial, moving from cadd/
#

. ../etc/bootstrap-functions.sh

install rocks-vmd
/sbin/ldconfig

compile_and_install hdf5
compile_and_install netcdf
compile_and_install fltk

