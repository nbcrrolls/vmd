#
# $Id: Makefile,v 1.2 2012/06/13 01:18:07 clem Exp $
#
# @Copyright@
# @Copyright@
#
# $Log: Makefile,v $
# Revision 1.2  2012/06/13 01:18:07  clem
# i can't say if it really works but the binary are there, aka it compiles
#
# Revision 1.1  2012/02/02 17:27:25  nadya
# move vmd to its own roll
#

PKGROOT		= /opt/vmd
PREREQ          = /opt
REDHAT.ROOT     = $(CURDIR)/../../
-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk
VMDARCH=LINUX

ifeq ($(ARCH),x86_64)
VMDARCH=LINUXAMD64
endif

build: 
	gunzip -c $(NAME)-$(VERSION).src.tar.gz | $(TAR) -xf -
	gunzip -c STRIDE.tar.gz | $(TAR) -xf - 
	gunzip -c SURF.tar.gz | $(TAR) -xf - 
	cd patch-files && find . -type f | grep -v CVS | cpio -pduv ../
	cd STRIDE; make; cp stride ../$(NAME)-$(VERSION)/lib/stride/stride_$(VMDARCH)
	cd SURF; make depend; make; cp surf ../$(NAME)-$(VERSION)/lib/surf/surf_$(VMDARCH)
	( cd plugins; \
		export NETCDFINC=-I$(PREREQ)/netcdf/include; \
		export NETCDFLIB=-L$(PREREQ)/netcdf/lib; \
		export PLUGINDIR=`pwd`/../$(NAME)-$(VERSION)/plugins; \
		export TCLINC=-I/usr/include; \
		export TCLLIB=-L/usr/lib64; \
		make $(VMDARCH) TCLINC=$(TCLINC) TCLLIB=$(TCLLIB); \
		make $(VMDARCH) distrib; 			\
	)
	(								\
	cd $(NAME)-$(VERSION); \
		export TCL_INCLUDE_DIR=/usr/include; \
		export TCL_LIBRARY_DIR=/usr/lib; \
		export PYTHON_INCLUDE_DIR=/usr/include/python2.6; \
		export PYTHON_LIBRARY_DIR=/usr/lib/python2.6; \
		export VMDINSTALLBINDIR=${PKGROOT}/bin; \
		export VMDINSTALLLIBRARYDIR=${PKGROOT};\
		./configure $(VMDARCH) OPENGL FLTK NETCDF TK TCL IMD SILENT PTHREADS PYTHON ;\
		mkdir -p lib/netcdf;  \
		ln -s $(PREREQ)/netcdf/lib lib/netcdf/lib_$(VMDARCH); \
		ln -s $(PREREQ)/fltk/include lib/fltk/include; \
		ln -s $(PREREQ)/fltk/lib lib/fltk/$(VMDARCH); \
		cd src; make veryclean; make \
	)

install::
	(						\
		mkdir -p $(ROOT)/$(PKGROOT);		\
		export MADEOPT=0;			\
		if [ ! -d $(PKGROOT) ]; then 		\
			mkdir $(PKGROOT);		\
			MADEOPT=1;			\
		fi;					\
		mount --bind $(ROOT)/$(PKGROOT) $(PKGROOT); \
		cd $(NAME)-$(VERSION)/src;		\
		make install;				\
		sed -i -e '4d #!/bin/bash ' $(ROOT)/$(PKGROOT)/bin/vmd; \
		umount $(ROOT)/$(PKGROOT);	\
	)


clean::
	rm -rf $(NAME)-$(VERSION) STRIDE SURF plugins
