allow:
	chmod +x build-layer.sh
	chmod +x zip-layer.sh
	chmod +x deploy-layer.sh

build:
	./build-layer.sh

zip:
	./zip-layer.sh

deploy:
	./deploy-layer.sh
