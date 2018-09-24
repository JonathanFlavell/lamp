all: clean build add

clean:
	vagrant destroy -f
	vagrant box remove centos-7

build:
	packer build centos-7.json

add:
	vagrant box add --name centos-7 builds/centos-7.box
