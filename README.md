# WServ

William Wood Harter building some kind of Wiliot app


```
docker build -t wserv1 -f Dockerfile_app .
docker run -p 5000:5000 --name wserv wserv1

# shell into the container
docker exec -it wserv bash

# send data to the flask endpoint
curl.exe -X POST -H "Content-Type: Application/json" -d "{\"hello\":\"world\"}" http://localhost:5000/api/add_data
```


### running in debug mode
I like the ability to shell into the container and start and stop flask and the other apps without having to rebuild the whole container every time.

```
docker build -t --build-arg WSERV_DEBUG="TRUE" wserv1 -f Dockerfile_app .
docker run -p 5000:5000 -v ${pwd}:/mnt/wserv --name wserv wserv1

docker exec -it wserv bash
cd /mnt/wserv
python3 watch.py&
cd wflask
flask run
```

