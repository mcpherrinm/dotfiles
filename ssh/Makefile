.PHONY=all
all: authorized_keys known_hosts

%_known_hosts: %_host
	ssh-keyscan -f $^ > $@

authorized_keys: id_rsa.pub.*.local
	cat $^ > authorized_keys

known_hosts: *_known_hosts CSCF_known_hosts
	cat $^ > known_hosts
