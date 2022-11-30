# ==============================================================================
# Arguments passing to Makefile commands

# pass a license key thru argument <make_command> LICENSE_KEY=XXXXXXX
# or put it in /keys/license.key file
KEY_FILE = $(pwd)/keys/license.key
LICENSE_KEY = `cat .$(KEY_FILE)`

DIST_FILE = $(pwd)/dist/linux-amd64_deb.tgz
DIST_EXIST = `ls .$(DIST_FILE)`

# ==============================================================================
# Docker build commands

build:
ifndef DIST_EXIST
	$(error "crypto pro distr is not provided, put linux-amd64_deb.tgz file in distr folder")
endif
	docker build -t cryptopro .

# ==============================================================================
# Docker run commands

run:
	docker run --rm -it \
    -v "/var/opt/cprocsp/keys/$(whoami):/var/opt/cprocsp/keys/root" \
    -v "$$(pwd)/docs:/home" \
    -e "LICENSE_KEY=$(LICENSE_KEY)" \
    cryptopro bash
