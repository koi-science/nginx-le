### Deploy

`docker network hk`

## To build an image

`docker build --tag=nginx-le .`

## To generate dh2048.pem (put in the directory with the rest of the files):

`openssl dhparam -out dh2048.pem 2048`


## To create a container

```
docker run -i --restart=always -p 80:80 -p 443:443 --network=hk -e LETSENCRYPT=true \
	-v="$(pwd)/koi.science.conf:/etc/nginx/koi.science.conf" \
	-v="$(pwd)/le.conf:/etc/nginx/le.conf" \
	-v="$(pwd)/../koi.science:/var/www/koi.science" \
	-v="$(pwd)/../downloads:/var/www/koi.science-downloads" \
	-v="$(pwd)/le:/etc/letsencrypt" \
	-v="$(pwd)/dh2048.pem:/etc/nginx/dh2048.pem" \
	--name=nginx-le nginx-le
```
