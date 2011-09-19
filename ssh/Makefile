.PHONY=all
all: authorized_keys known_hosts

authorized_keys: id_rsa.pub.*.local
	cat $^ > authorized_keys

CSCF_known_hosts: CSCF_known_hosts_url
	wget "`cat $<`" -O $@

known_hosts: *_known_hosts CSCF_known_hosts
	cat $^ > known_hosts
