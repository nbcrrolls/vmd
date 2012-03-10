# $Id: Makefile,v 1.2 2012/03/10 02:29:02 clem Exp $
#
# @Copyright@
# @Copyright@
#
# $Log: Makefile,v $
# Revision 1.2  2012/03/10 02:29:02  clem
# Makefile to build all the cadd roll
#
# Revision 1.1  2012/01/28 03:09:36  nadya
# initial, moving from cadd/
#

SRCDIRS = `find . -type d -maxdepth 1 -not -name CVS -not -name .`

default:	rpm

copyright rpm pkg clean::
	for i in $(SRCDIRS) ; do \
		cd $$i; \
		$(MAKE) $@ || exit 2 ; \
		cd ..; \
	done

