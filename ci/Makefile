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
	$(call build_docker,$@)

# 14.04, trusty
ubuntu/trusty:
	$(call build_docker,$@)

# 16.04, xenial
# 16.10, yakkety
# 17.04, zesty

define build_docker
	install -d $1
	sed -e 's;{{IMAGE}};$(subst /,:,$1);' Dockerfile > $1/Dockerfile
	docker build -t $1 -f $1/Dockerfile --build-arg packages='$(PACKAGES)' .
	docker run -v $(CURDIR)/..:/build -w /build $@ sh -c './autogen.sh && ./configure && make && make distcheck'
endef

.PHONY: $(PLATFORMS)
