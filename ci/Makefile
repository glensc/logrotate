#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, version 2 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
#

PLATFORMS := ubuntu/precise ubuntu/trusty

PACKAGES := make autoconf libtool libpopt-dev xz-utils

all: $(PLATFORMS)

# use '/' as separator as ':' denotes end of rule name

# 12.04, precise
ubuntu/precise:
	install -d $@
	sed -e 's;{{IMAGE}};$(subst /,:,$@);' Dockerfile > $@/Dockerfile
	docker build -t $@ -f $@/Dockerfile --build-arg packages='$(PACKAGES)' .
	docker run -v $(CURDIR)/..:/build -w /build $@ sh -c './autogen.sh && ./configure && make && make distcheck'

# 14.04, trusty
ubuntu/trusty:
	install -d $@
	sed -e 's;{{IMAGE}};$(subst /,:,$@);' Dockerfile > $@/Dockerfile
	docker build -t $@ -f $@/Dockerfile --build-arg packages='$(PACKAGES)' .
	docker run -v $(CURDIR)/..:/build -w /build $@ sh -c './autogen.sh && ./configure && make && make distcheck'

# 16.04, xenial
# 16.10, yakkety
# 17.04, zesty

.PHONY: $(PLATFORMS)
