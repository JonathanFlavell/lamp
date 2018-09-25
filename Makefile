all: clean build add

clean:
	vagrant destroy -f
	vagrant box remove lamp/web
	vagrant box remove lamp/load-balancer
	vagrant box remove lamp/database

build:
	packer build web.json
	packer build load-balancer.json
	packer build database.json

add:
	vagrant box add --name lamp/web builds/web.box
	vagrant box add --name lamp/load-balancer builds/load-balancer.box
	vagrant box add --name lamp/database builds/database.box
