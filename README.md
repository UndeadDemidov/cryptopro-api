# CryptoPRO CSP 5.0

## Build

- Put CryptoPRO CSP 5.0 deb package to `dist/linux-amd64_deb.tgz` path

- Build image `docker build -t cryptopro .` or `make build`

## Run
### Prerequisites
Install Crypto Pro locally and install signing keys.
Check keys are installed properly.
```
ls /var/opt/cprocsp/keys/$(whoami)
```

Linux, Mac OS
```
docker run --rm -it \
    -v "/var/opt/cprocsp/keys/$(whoami):/var/opt/cprocsp/keys/root" \
    -v "$(pwd)/docs:/home" \
    -e "LICENSE_KEY=40406-A0000-0219M-Q778D-1Y222" \
    cryptopro bash
```

Or

`make run LICENSE_KEY=<license key>`
## Usage

List containers:

`csptestf -keys -enum -verifyc -fqcn`

List certs:

`certmgr -list`

Sign data:

```
cryptcp \
    -sign \
    -der \
    -detach \
    -nochain \
    -norev \
    -thumbprint <thumbprint_of_your_sign_key> \
    /home/<signing_filename> \
    /home/<signing_filename>.sig \
    -pin <password_of_your_sign_key>
```

Export key from USB token to PFX file:

`certmgr -export -pfx -dest 123.pfx`

Import key from PFX file:

`certmgr -install -pfx -file 123.pfx`

`csptestf -absorb -certs -autoprov`

`ls /var/opt/cprocsp/keys/root`

install keys thru volume

http://blog.pws.ru/2015/08/11/install-private-key/?ysclid=l9qor8j3hw425871117

ver
`csptest -enum -info`