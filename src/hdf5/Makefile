#
# $Id: Makefile,v 1.4 2012/03/30 22:05:53 nadya Exp $
#
# @Copyright@
# @Copyright@
#
# $Log: Makefile,v $
# Revision 1.4  2012/03/30 22:05:53  nadya
# rm libz.so from binary distro. was breaking roll install
#
# Revision 1.3  2012/02/25 01:48:34  nadya
# move ld configuration to vmd.config
#
# Revision 1.2  2012/02/06 18:39:38  nadya
# update PKGROOT
#
# Revision 1.1  2012/01/28 03:09:37  nadya
# initial, moving from cadd/
#

PKGROOT		= /opt/hdf5
REDHAT.ROOT     = $(CURDIR)/../../
-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk

HDF5FILES = bin  COPYING  include  lib  README  RELEASE.txt  share

build:
	gunzip -c $(NAME)-$(VERSION)-$(EXT).tar.gz | $(TAR) -xf -
	(cd $(NAME)-$(VERSION)-$(EXT)/lib; rm -rf libz.so* )
	cd patch-files && find . -type f | grep -v CVS | cpio -pduv ../
	
install::
	mkdir -p $(ROOT)/$(PKGROOT)
	mkdir -p $(ROOT)/etc/ld.so.conf.d
	(                                              \
		cd $(NAME)-$(VERSION)-$(EXT);          \
		cp -p -r $(HDF5FILES)  $(ROOT)/$(PKGROOT); \
	)

clean::
	rm -rf $(NAME)-$(VERSION)
