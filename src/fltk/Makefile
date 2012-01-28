#
# $Id: Makefile,v 1.1 2012/01/28 03:09:36 nadya Exp $
#
# @Copyright@
# @Copyright@
#
# $Log: Makefile,v $
# Revision 1.1  2012/01/28 03:09:36  nadya
# initial, moving from cadd/
#

PKGROOT		= /opt/fltk
REDHAT.ROOT     = $(CURDIR)/../../
-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk

OPTS =  --enable-shared --enable-threads --enable-xdbe --enable-xft        

build:
	gunzip -c $(NAME)-$(VERSION)-source.tar.gz | $(TAR) -xf -
	(								\
		cd $(NAME)-$(VERSION);					\
		./configure --prefix=$(PKGROOT) $(OPTS)      ;\
	)
	

install::
	mkdir -p $(ROOT)/$(PKGROOT)
	(								\
		cd $(NAME)-$(VERSION);					\
		make DESTDIR=$(ROOT) install			\
	)

clean::
	rm -rf $(NAME)-$(VERSION)
