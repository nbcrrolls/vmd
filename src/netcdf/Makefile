#
# $Id: Makefile,v 1.1 2012/01/28 03:09:38 nadya Exp $
#
# @Copyright@
# @Copyright@
#
# $Log: Makefile,v $
# Revision 1.1  2012/01/28 03:09:38  nadya
# initial, moving from cadd/
#

PKGROOT		= /opt/netcdf
HDF5ROOT	= /opt/hdf5
REDHAT.ROOT     = $(CURDIR)/../../
-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk


build:
	gunzip -c $(NAME)-$(VERSION).tar.gz | $(TAR) -xf -
	cd patch-files && find . -type f | grep -v CVS | cpio -pduv ../
	(							\
		cd $(NAME)-$(VERSION);				\
		export CPPFLAGS=-I$(HDF5ROOT)/include;		\
		export LDFLAGS=-L$(HDF5ROOT)/lib;		\
		export CC="/usr/bin/gcc -fPIC";			\
		export FC=/usr/bin/gfortran;				\
		./configure --prefix=$(PKGROOT);		\
		make check					\
	)
	

install::
	mkdir -p $(ROOT)/$(PKGROOT)
	(								\
		cd $(NAME)-$(VERSION);					\
		make DESTDIR=$(ROOT) install			\
	)

clean::
	rm -rf $(NAME)-$(VERSION)
