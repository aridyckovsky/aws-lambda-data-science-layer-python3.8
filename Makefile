allow:
	chmod +x create-bucket.sh
	chmod +x build-layer.sh
	chmod +x zip-layer.sh
	chmod +x deploy-layer.sh

bucket:
	./create-bucket.sh

build:
	./build-layer.sh

zip:
	./zip-layer.sh

deploy:
	./create-bucket.sh
	./deploy-layer.sh
