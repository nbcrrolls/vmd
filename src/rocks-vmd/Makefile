#
# $Id: Makefile,v 1.1 2012/02/25 01:43:21 nadya Exp $
#
# @Copyright@
# @Copyright@
#
# $Log: Makefile,v $
# Revision 1.1  2012/02/25 01:43:21  nadya
# add profiles and make
#
#
#

REDHAT.ROOT     = $(CURDIR)/../../
-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk

PROFILES = rocks-vmd.sh rocks-vmd.csh
LDCONFIG = vmd.conf

build:
	echo "Nothing explicit to Build"

install::
	mkdir -p $(ROOT)/etc/profile.d
	mkdir -p $(ROOT)/etc/ld.so.conf.d
	install $(PROFILES) $(ROOT)/etc/profile.d
	install -m 644 $(LDCONFIG) $(ROOT)/etc/ld.so.conf.d

clean::
