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

PLATFORMS =
APT_PACKAGES := make autoconf libtool libpopt-dev xz-utils
YUM_PACKAGES := make autoconf automake libtool popt-devel

all: build-all

# use '/' as separator as ':' denotes end of rule name

# 12.04, precise
PLATFORMS += ubuntu/precise
ubuntu/precise:
	$(MAKE) build_docker PLATFORM=$@ PACKAGE_MANAGER=apt PACKAGES='$(APT_PACKAGES)'
	$(MAKE) build PLATFORM=$@

# 14.04, trusty
PLATFORMS += ubuntu/trusty
ubuntu/trusty:
	$(MAKE) build_docker PLATFORM=$@ PACKAGE_MANAGER=apt PACKAGES='$(APT_PACKAGES)'
	$(MAKE) build PLATFORM=$@

# 16.04, xenial
PLATFORMS += ubuntu/xenial
ubuntu/xenial:
	$(MAKE) build_docker PLATFORM=$@ PACKAGE_MANAGER=apt PACKAGES='$(APT_PACKAGES)'
	$(MAKE) build PLATFORM=$@

# 16.10, yakkety
PLATFORMS += ubuntu/yakkety
ubuntu/yakkety:
	$(MAKE) build_docker PLATFORM=$@ PACKAGE_MANAGER=apt PACKAGES='$(APT_PACKAGES)'
	$(MAKE) build PLATFORM=$@

# 17.04, zesty
PLATFORMS += ubuntu/zesty
ubuntu/zesty:
	$(MAKE) build_docker PLATFORM=$@ PACKAGE_MANAGER=apt PACKAGES='$(APT_PACKAGES)'
	$(MAKE) build PLATFORM=$@

PLATFORMS += fedora/20
fedora/20:
	$(MAKE) build_docker PLATFORM=$@ PACKAGE_MANAGER=yum PACKAGES='$(YUM_PACKAGES)'
	$(MAKE) build PLATFORM=$@

PLATFORMS += fedora/21
fedora/21:
	$(MAKE) build_docker PLATFORM=$@ PACKAGE_MANAGER=yum PACKAGES='$(YUM_PACKAGES)'
	$(MAKE) build PLATFORM=$@

PLATFORMS += fedora/22
fedora/22:
	$(MAKE) build_docker PLATFORM=$@ PACKAGE_MANAGER=yum PACKAGES='$(YUM_PACKAGES)'
	$(MAKE) build PLATFORM=$@

PLATFORMS += fedora/23
fedora/23:
	$(MAKE) build_docker PLATFORM=$@ PACKAGE_MANAGER=yum PACKAGES='$(YUM_PACKAGES)'
	$(MAKE) build PLATFORM=$@

PLATFORMS += fedora/24
fedora/24:
	$(MAKE) build_docker PLATFORM=$@ PACKAGE_MANAGER=yum PACKAGES='$(YUM_PACKAGES)'
	$(MAKE) build PLATFORM=$@

PLATFORMS += fedora/25
fedora/25:
	$(MAKE) build_docker PLATFORM=$@ PACKAGE_MANAGER=yum PACKAGES='$(YUM_PACKAGES)'
	$(MAKE) build PLATFORM=$@

PLATFORMS += fedora/rawhide
fedora/rawhide:
	$(MAKE) build_docker PLATFORM=$@ PACKAGE_MANAGER=yum PACKAGES='$(YUM_PACKAGES)'
	$(MAKE) build PLATFORM=$@

PLATFORMS += centos/centos5
centos/centos5:
	$(MAKE) build_docker PLATFORM=$@ PACKAGE_MANAGER=yum PACKAGES='$(YUM_PACKAGES)'
	$(MAKE) build PLATFORM=$@

PLATFORMS += centos/centos6
centos/centos6:
	$(MAKE) build_docker PLATFORM=$@ PACKAGE_MANAGER=yum PACKAGES='$(YUM_PACKAGES)'
	$(MAKE) build PLATFORM=$@

PLATFORMS += centos/centos7
centos/centos7:
	$(MAKE) build_docker PLATFORM=$@ PACKAGE_MANAGER=yum PACKAGES='$(YUM_PACKAGES)'
	$(MAKE) build PLATFORM=$@

build_docker:
	install -d $(PLATFORM)
	sed -e 's;{{IMAGE}};$(subst /,:,$(PLATFORM));' Dockerfile.$(PACKAGE_MANAGER) > $(PLATFORM)/Dockerfile
	docker build -t $(PLATFORM) -f $(PLATFORM)/Dockerfile --build-arg packages='$(PACKAGES)' .

build-all: $(PLATFORMS)

build:
	docker run -v $(CURDIR)/..:/build -w /build $(PLATFORM) ci/build.sh $(PLATFORM)

.PHONY: $(PLATFORMS)
